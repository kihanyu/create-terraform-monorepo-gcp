#!/bin/bash

# Terraform Module Publishing Script
# Version: 1.1.0
# Supports: GitHub, Terraform Registry, Private Module Registry

# Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
CONFIG_FILE=".module-publish.conf"
CHANGELOG_FILE="CHANGELOG.md"
README_FILE="README.md"

# Logging
LOG_DIR="./publish_logs"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
LOG_FILE="${LOG_DIR}/module_publish_${TIMESTAMP}.log"

# Ensure log directory exists
mkdir -p "$LOG_DIR"

# Load Configuration
load_config() {
    if [ -f "$CONFIG_FILE" ]; then
        # shellcheck source=/dev/null
        source "$CONFIG_FILE"
    else
        echo -e "${RED}✗ Configuration file not found${NC}"
        exit 1
    fi
}

# Validate Semantic Version
validate_semver() {
    local version=$1
    if [[ ! "$version" =~ ^v?[0-9]+\.[0-9]+\.[0-9]+(-[0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*)?(\+[0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*)?$ ]]; then
        echo -e "${RED}✗ Invalid Semantic Version: $version${NC}"
        exit 1
    fi
}

# Pre-Publish Validation
pre_publish_checks() {
    echo -e "${BLUE}[VALIDATE] Running Pre-Publish Checks${NC}"
    
    # Run module validation script
    if [ -f "module-validate.sh" ]; then
        ./module-validate.sh
    else
        echo -e "${YELLOW}⚠️ No validation script found${NC}"
    fi

    # Check for required files
    local required_files=("main.tf" "variables.tf" "outputs.tf" "versions.tf" "README.md")
    for file in "${required_files[@]}"; do
        if [ ! -f "$file" ]; then
            echo -e "${RED}✗ Missing required file: $file${NC}"
            exit 1
        fi
    done
}

# Generate Changelog
generate_changelog() {
    local new_version=$1
    
    echo -e "${BLUE}[CHANGELOG] Generating Changelog${NC}"
    
    # Create or update CHANGELOG.md
    if [ ! -f "$CHANGELOG_FILE" ]; then
        touch "$CHANGELOG_FILE"
    fi

    # Prepend new version details
    {
        echo "## $new_version - $(date +'%Y-%m-%d')"
        echo ""
        echo "### Added"
        echo "- New module version"
        echo ""
        echo "### Changed"
        echo "- Updated module implementation"
        echo ""
        echo "### Fixed"
        echo "- Various bug fixes and improvements"
        echo ""
        cat "$CHANGELOG_FILE"
    } > "$CHANGELOG_FILE.tmp"

    mv "$CHANGELOG_FILE.tmp" "$CHANGELOG_FILE"
}

# Update Module Metadata
update_metadata() {
    local new_version=$1
    
    echo -e "${BLUE}[METADATA] Updating Module Metadata${NC}"
    
    # Update metadata.json
    if [ -f "metadata.json" ]; then
        jq --arg version "$new_version" \
           '.version = $version | 
            .last_updated = "'$(date -u +"%Y-%m-%dT%H:%M:%SZ")'"' \
            metadata.json > metadata.json.tmp
        mv metadata.json.tmp metadata.json
    fi

    # Update versions.json in module registry
    if [ -f "../versions.json" ]; then
        jq --arg version "$new_version" \
           --arg path "$(pwd)" \
           '.versions += [{
               "version": $version,
               "path": $path,
               "date": "'$(date -u +"%Y-%m-%dT%H:%M:%SZ")'"
           }]' \
           "../versions.json" > "../versions.json.tmp"
        mv "../versions.json.tmp" "../versions.json"
    fi
}

# Publish to GitHub Releases
publish_github_release() {
    local new_version=$1
    
    echo -e "${BLUE}[GITHUB] Publishing GitHub Release${NC}"
    
    # Create GitHub Release
    gh release create "$new_version" \
        --repo "$GITHUB_REPO" \
        --title "Module Release $new_version" \
        --notes-file "$CHANGELOG_FILE"
}

# Publish to Terraform Registry
publish_terraform_registry() {
    local new_version=$1
    
    echo -e "${BLUE}[TERRAFORM REGISTRY] Publishing Module${NC}"
    
    # Terraform Registry requires specific structure
    # This is a placeholder - adjust based on your registry setup
    terraform login
    
    # Create module version
    curl -X POST \
        -H "Authorization: Bearer $TERRAFORM_REGISTRY_TOKEN" \
        -H "Content-Type: application/vnd.api+json" \
        https://registry.terraform.io/v2/organizations/"$TERRAFORM_ORG"/modules \
        -d "{
            \"data\": {
                \"type\": \"modules\",
                \"attributes\": {
                    \"name\": \"$MODULE_NAME\",
                    \"version\": \"$new_version\"
                }
            }
        }"
}

# Git Operations
git_operations() {
    local new_version=$1
    
    echo -e "${BLUE}[GIT] Performing Git Operations${NC}"
    
    # Stage changes
    git add .
    
    # Commit with version message
    git commit -m "Bump module version to $new_version"
    
    # Create version tag
    git tag "$new_version"
    
    # Push changes and tags
    git push origin main
    git push origin "$new_version"
}

# Main Publish Function
publish_module() {
    local new_version=$1
    
    echo -e "${YELLOW}🚀 Publishing Module: $new_version${NC}"
    
    # Load configuration
    load_config
    
    # Validate version
    validate_semver "$new_version"
    
    # Pre-publish checks
    pre_publish_checks
    
    # Generate changelog
    generate_changelog "$new_version"
    
    # Update metadata
    update_metadata "$new_version"
    
    # Git operations
    git_operations "$new_version"
    
    # Publish to different platforms
    publish_github_release "$new_version"
    publish_terraform_registry "$new_version"
    
    echo -e "${GREEN}✅ Module Published Successfully${NC}"
}

# Configuration File Template
create_config_template() {
    cat > "$CONFIG_FILE" << EOL
# Module Publishing Configuration

# GitHub Repository
GITHUB_REPO="your-org/your-module"

# Terraform Registry Configuration
TERRAFORM_ORG="your-organization"
MODULE_NAME="your-module-name"

# Publishing Platforms
PUBLISH_GITHUB=true
PUBLISH_TERRAFORM_REGISTRY=true
PUBLISH_PRIVATE_REGISTRY=false

# Notification Settings
SLACK_WEBHOOK=""
EMAIL_NOTIFICATIONS=""
EOL
    
    echo -e "${GREEN}✓ Configuration template created at $CONFIG_FILE${NC}"
}

# Error Handling
trap 'echo -e "${RED}❌ Module Publish Failed${NC}"' ERR

# Script Entrypoint
main() {
    case "$1" in
        "init")
            create_config_template
            ;;
        "publish")
            if [ -z "$2" ]; then
                echo -e "${RED}✗ Please provide a version number${NC}"
                echo "Usage: $0 publish v1.2.3"
                exit 1
            fi
            publish_module "$2"
            ;;
        *)
            echo "Usage: $0 {init|publish}"
            exit 1
            ;;
    esac
}

# Execute Main Function
main "$@"