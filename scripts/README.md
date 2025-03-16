# Usage

## module-validate.sh

```bash
# Make script executable
chmod +x module-validate.sh

# Run validation
./module-validate.sh

# Optional: Validate specific module
./module-validate.sh path/to/module
```

### Key Validation Checks

1. Terraform Version Compatibility
2. Module Structure Validation
3. Code Formatting
4. Syntax Validation
5. Security Scanning

   - Terrascan
   - Checkov

6. Linting

   - TFLint

7. Comprehensive Logging

### Prerequisites

- Terraform
- jq
- wget
- unzip
- pip
- Python 3

## module-publish-v2

```bash
# Initialize configuration
./module-publish.sh init

# Publish a new module version
./module-publish.sh publish v1.2.3
```