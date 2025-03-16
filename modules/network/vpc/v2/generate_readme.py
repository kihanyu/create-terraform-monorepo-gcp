#!/usr/bin/env python3
import sys
import os

# Append the project root to Python path
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../..'))
sys.path.append(project_root)

# Import the base README generator
from scripts.readme_generator import ReadmeGenerator

def main():
    module_path = os.path.dirname(os.path.abspath(__file__))
    generator = ReadmeGenerator(module_path)
    
    # Optional: Add module-specific customizations
    generator.metadata['module_description'] = """
    Advanced GCP Network Module with multi-subnet support
    and enhanced network configuration capabilities.
    """
    
    generator.generate_readme()

if __name__ == '__main__':
    main()