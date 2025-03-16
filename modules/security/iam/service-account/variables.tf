variable "name" {
  description = "Name of the VPC network"
  type        = string
}

variable "region" {
  description = "GCP region for the subnets"
  type        = string
  default     = "us-central1"
}

variable "subnetworks" {
  description = "List of subnet configurations"
  type = list(object({
    name = string
    cidr = string
  }))
}