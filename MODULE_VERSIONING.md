# Terraform Module Versioning Guide

## Versioning Strategy

- Use Semantic Versioning (SemVer)
- Major version for breaking changes
- Minor version for backwards-compatible features
- Patch version for backwards-compatible bug fixes

## Versioning Workflow

1. Create new version directory
2. Update module implementation
3. Run validation scripts
4. Update versions.json
5. Tag and publish

## Version Compatibility

- v1.x: Initial implementation
- v2.x: Enhanced features
- v3.x: Major architectural changes

## Migration Guidelines

- Check changelog
- Review breaking changes
- Update module references
