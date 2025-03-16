#!/usr/bin/env python3

import os
import json
import re
import sys
import hcl2
import markdown

class ReadmeGenerator:
    def __init__(self, module_path):
        self.module_path = module_path
        self.metadata = self._load_metadata()
        self.terraform_files = self._find_terraform_files()

    def _load_metadata(self):
        with open(os.path.join(self.module_path, 'metadata.json'), 'r') as f:
            return json.load(f)

    def _find_terraform_files(self):
        tf_files = []
        for root, _, files in os.walk(self.module_path):
            tf_files.extend([
                os.path.join(root, f) for f in files if f.endswith('.tf')
            ])
        return tf_files

    def extract_variables(self):
        variables = []
        for tf_file in self.terraform_files:
            with open(tf_file, 'r') as f:
                try:
                    parsed = hcl2.load(f)
                    if 'variable' in parsed:
                        for var in parsed['variable']:
                            var_name = list(var.keys())[0]
                            var_details = var[var_name]
                            variables.append({
                                'name': var_name,
                                'description': var_details.get('description', [''])[0],
                                'type': var_details.get('type', ['unknown'])[0],
                                'default': var_details.get('default', ['N/A'])[0],
                                'required': 'default' not in var_details
                            })
                except Exception as e:
                    print(f"Error parsing {tf_file}: {e}")
        return variables

    def extract_outputs(self):
        outputs = []
        for tf_file in self.terraform_files:
            with open(tf_file, 'r') as f:
                try:
                    parsed = hcl2.load(f)
                    if 'output' in parsed:
                        for out in parsed['output']:
                            out_name = list(out.keys())[0]
                            out_details = out[out_name]
                            outputs.append({
                                'name': out_name,
                                'description': out_details.get('description', [''])[0]
                            })
                except Exception as e:
                    print(f"Error parsing {tf_file}: {e}")
        return outputs

    def generate_readme(self):
        template = self._load_template()
        
        # Replace placeholders
        readme = template.replace('${MODULE_NAME}', self.metadata['module_name'])
        readme = readme.replace('${MODULE_VERSION}', self.metadata['version'])
        
        # Generate inputs table
        inputs = self.extract_variables()
        inputs_table = self._generate_inputs_table(inputs)
        readme = readme.replace('${INPUTS_TABLE}', inputs_table)
        
        # Generate outputs table
        outputs = self.extract_outputs()
        outputs_table = self._generate_outputs_table(outputs)
        readme = readme.replace('${OUTPUTS_TABLE}', outputs_table)
        
        # Add other metadata
        readme = readme.replace('${TERRAFORM_COMPATIBILITY}', 
                                self.metadata['compatibility']['terraform'])
        readme = readme.replace('${PROVIDER_COMPATIBILITY}', 
                                self.metadata['compatibility']['google_provider'])
        
        # Write README
        with open(os.path.join(self.module_path, 'README.md'), 'w') as f:
            f.write(readme)

    def _load_template(self):
        with open(os.path.join(self.module_path, 'README.md.tpl'), 'r') as f:
            return f.read()

    def _generate_inputs_table(self, inputs):
        table = []
        for var in inputs:
            row = f"| {var['name']} | {var['description']} | {var['type']} | {var['default']} | {var['required']} |"
            table.append(row)
        return "\n".join(table)

    def _generate_outputs_table(self, outputs):
        table = []
        for out in outputs:
            row = f"| {out['name']} | {out['description']} |"
            table.append(row)
        return "\n".join(table)

def main():
    module_path = sys.argv[1] if len(sys.argv) > 1 else '.'
    generator = ReadmeGenerator(module_path)
    generator.generate_readme()
    print(f"README.md generated for {module_path}")

if __name__ == '__main__':
    main()