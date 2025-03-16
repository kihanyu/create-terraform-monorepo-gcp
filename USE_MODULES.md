# GCP Terraform Modules

This repository contains a set of Terraform modules for provisioning resources on Google Cloud Platform.

## Modules

- [Network](modules/network)
- [Compute](modules/compute)
- [Databases](modules/databases)
- [Storage](modules/storage)
- [Security](modules/security)
- [Monitoring](modules/monitoring)
- [Messaging](modules/messaging)
- [AI/ML](modules/ai-ml)
- [Hybrid Cloud](modules/hybrid-cloud)

## Usage

To use a module, include it in your Terraform configuration:

```hcl
module "my_vpc" {
  source      = "github.com/your-org/gcp-terraform-modules//modules/network/vpc"
  name        = "my-vpc"
  region      = "us-central1"
  subnetworks = [
    {
      name = "subnet1"
      cidr = "10.0.1.0/24"
    },
    {
      name = "subnet2"
      cidr = "10.0.2.0/24"
    },
  ]
}
