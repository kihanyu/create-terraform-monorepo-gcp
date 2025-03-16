#!/usr/bin/env python3
import sys
import os

# Append parent directory to Python path
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

# Import the base README generator
from generate_readme import ReadmeGenerator

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