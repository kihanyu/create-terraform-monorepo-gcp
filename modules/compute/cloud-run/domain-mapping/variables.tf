variable "service_name" {
  description = "Cloud Run service name"
  type        = string
}

variable "location" {
  description = "GCP location for the domain mapping"
  type        = string
}

variable "domain_mapping_id" {
  description = "The domain mapping ID"
  type        = string
}