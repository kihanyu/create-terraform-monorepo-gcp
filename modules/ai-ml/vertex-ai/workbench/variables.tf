variable "instance_name" {
  description = "Name of the notebook instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type to use for the instance"
  type        = string
  default     = "n1-standard-4"
}

variable "region" {
  description = "Region for the notebook instance"
  type        = string
  default     = "us-central1"
}