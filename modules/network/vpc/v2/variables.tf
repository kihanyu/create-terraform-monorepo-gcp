variable "environment" {
  description = "The environment for naming the VPC (e.g., dev, staging, prod)"
  type        = string
}

variable "subnets" {
  description = "A map of subnets to create, with details for each subnet"
  type        = map(object({
    cidr   = string
    region = string
  }))
}