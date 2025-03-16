variable "domain_mapping_name" {
  description = "The name of the domain mapping"
  type        = string
}

variable "location" {
  description = "The location of the Cloud Run service"
  type        = string
}

variable "domain_mapping_id" {
  description = "ID of the domain mapping"
  type        = string
}

variable "route_name" {
  description = "The name of the Cloud Run service route that the domain mapping will point to"
  type        = string
}