#!/bin/bash

# Terraform Module Validation Script
# Version: 1.0.0
# Author: Your Organization

# Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
TERRAFORM_MIN_VERSION="1.5.0"
TFLINT_VERSION="0.44.1"
TERRASCAN_VERSION="1.18.0"
CHECKOV_VERSION="2.3.4"

# Logging
LOG_DIR="./validation_logs"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
LOG_FILE="${LOG_DIR}/module_validation_${TIMESTAMP}.log"

# Ensure log directory exists
mkdir -p "$LOG_DIR"

# Validation Functions
validate_terraform_version() {
    echo -e "${BLUE}[VALIDATE] Checking Terraform Version${NC}"
    
    CURRENT_VERSION=$(terraform version -json | jq -r '.terraform_version')
    
    if [[ "$(printf '%s\n' "$TERRAFORM_MIN_VERSION" "$CURRENT_VERSION" | sort -V | head -n1)" == "$TERRAFORM_MIN_VERSION" ]]; then
        echo -e "${GREEN}✓ Terraform Version: $CURRENT_VERSION${NC}"
    else
        echo -e "${RED}✗ Minimum Terraform Version Required: $TERRAFORM_MIN_VERSION${NC}"
        exit 1
    fi
}

install_validation_tools() {
    echo -e "${BLUE}[SETUP] Installing Validation Tools${NC}"
    
    # Install tflint
    if ! command -v tflint &> /dev/null; then
        echo "Installing tflint..."
        wget https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip
        unzip tflint_linux_amd64.zip
        chmod +x tflint
        sudo mv tflint /usr/local/bin/
    fi
    
    # Install terrascan
    if ! command -v terrascan &> /dev/null; then
        echo "Installing terrascan..."
        wget https://github.com/accurics/terrascan/releases/download/v${TERRASCAN_VERSION}/terrascan_${TERRASCAN_VERSION}_Linux_x86_64.tar.gz
        tar -xzf terrascan_${TERRASCAN_VERSION}_Linux_x86_64.tar.gz
        sudo mv terrascan /usr/local/bin/
    fi
    
    # Install checkov
    pip install checkov==${CHECKOV_VERSION}
}

run_tflint() {
    echo -e "${BLUE}[LINT] Running TFLint${NC}"
    tflint --init
    tflint --format=json > "${LOG_DIR}/tflint_results.json"
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ TFLint Passed${NC}"
    else
        echo -e "${RED}✗ TFLint Detected Issues${NC}"
        cat "${LOG_DIR}/tflint_results.json"
    fi
}

run_terrascan() {
    echo -e "${BLUE}[SECURITY] Running Terrascan${NC}"
    terrascan scan -d . -o json > "${LOG_DIR}/terrascan_results.json"
    
    HIGH_RISK=$(jq '.results.violations | map(select(.severity == "HIGH")) | length' "${LOG_DIR}/terrascan_results.json")
    
    if [ "$HIGH_RISK" -eq 0 ]; then
        echo -e "${GREEN}✓ No High-Risk Security Vulnerabilities${NC}"
    else
        echo -e "${RED}✗ $HIGH_RISK High-Risk Vulnerabilities Detected${NC}"
        jq '.results.violations | map(select(.severity == "HIGH"))' "${LOG_DIR}/terrascan_results.json"
    fi
}

run_checkov() {
    echo -e "${BLUE}[COMPLIANCE] Running Checkov${NC}"
    checkov -d . --output json > "${LOG_DIR}/checkov_results.json"
    
    FAILED_CHECKS=$(jq '.results.failed_checks | length' "${LOG_DIR}/checkov_results.json")
    
    if [ "$FAILED_CHECKS" -eq 0 ]; then
        echo -e "${GREEN}✓ All Compliance Checks Passed${NC}"
    else
        echo -e "${YELLOW}⚠️ $FAILED_CHECKS Compliance Checks Failed${NC}"
        jq '.results.failed_checks' "${LOG_DIR}/checkov_results.json"
    fi
}

validate_module_structure() {
    echo -e "${BLUE}[STRUCTURE] Validating Module Structure${NC}"
    
    REQUIRED_FILES=("main.tf" "variables.tf" "outputs.tf" "versions.tf")
    MISSING_FILES=()
    
    for file in "${REQUIRED_FILES[@]}"; do
        if [ ! -f "$file" ]; then
            MISSING_FILES+=("$file")
        fi
    done
    
    if [ ${#MISSING_FILES[@]} -eq 0 ]; then
        echo -e "${GREEN}✓ Module Structure Complete${NC}"
    else
        echo -e "${RED}✗ Missing Files: ${MISSING_FILES[*]}${NC}"
        exit 1
    fi
}

terraform_validate() {
    echo -e "${BLUE}[TERRAFORM] Running Terraform Validation${NC}"
    terraform fmt -check
    terraform validate
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Terraform Validation Passed${NC}"
    else
        echo -e "${RED}✗ Terraform Validation Failed${NC}"
        exit 1
    fi
}

main() {
    echo -e "${YELLOW}🚀 Terraform Module Validation Started${NC}"
    
    # Validate and Install Tools
    validate_terraform_version
    install_validation_tools
    
    # Validate Module
    validate_module_structure
    terraform_validate
    
    # Run Validation Tools
    run_tflint
    run_terrascan
    run_checkov
    
    echo -e "${GREEN}✅ Module Validation Complete${NC}"
}

# Error Handling
trap 'echo -e "${RED}❌ Validation Failed${NC}"' ERR

# Execute Main Function
main