#!/bin/bash
set -e

# Module versioning and publishing script

MODULE_PATH=$1
NEW_VERSION=$2

# Validate inputs
if [ -z "$MODULE_PATH" ] || [ -z "$NEW_VERSION" ]; then
    echo "Usage: $0 <module_path> <new_version>"
    exit 1
}

# Validate semantic versioning
if [[ ! "$NEW_VERSION" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Invalid version format. Use v1.0.0"
    exit 1
}

# Create new version directory
cp -R "$MODULE_PATH" "$MODULE_PATH-$NEW_VERSION"

# Update versions.json
python3 - <<EOF
import json
import os

module_dir = "${MODULE_PATH}-${NEW_VERSION}"
versions_file = os.path.join(os.path.dirname(module_dir), "versions.json")

# Read existing versions
try:
    with open(versions_file, 'r') as f:
        versions = json.load(f)
except FileNotFoundError:
    versions = []

# Add new version
new_version = {
    "version": "${NEW_VERSION}",
    "path": module_dir,
    "date": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
    "compatible_tf_versions": ">=1.5.0"
}

versions.append(new_version)
versions.sort(key=lambda x: [int(v) for v in x['version'][1:].split('.')])

# Write updated versions
with open(versions_file, 'w') as f:
    json.dump(versions, f, indent=2)

print(f"Published {module_dir}")
EOF