module "network" {
  # Git-based module source with version
  source = "git::https://github.com/your-org/terraform-modules.git//network/v2?ref=v2.0.0"  
  version = "~> 2.0.0"
}