provider "google" {
  credentials = file("<PATH_TO_YOUR_SERVICE_ACCOUNT_KEY>.json") # Path to your GCP service account key
  project     = var.project_id
  region      = var.region
}

module "vpc" {
  source     = "../" # Path to the parent VPC module
  name = "test-vpc"
  subnetworks = {
    "subnet-1" = {
      cidr   = "10.0.0.0/24"
      region = "us-central1"
    }
  }
}

# Output the IDs for validation
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnetwork_ids" {
  value = module.vpc.subnetwork_ids
}