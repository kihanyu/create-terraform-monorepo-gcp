variable "name" {
  description = "Name of the interconnect attachment"
  type        = string
}

variable "interconnect_id" {
  description = "ID of the interconnect"
  type        = string
}

variable "region" {
  description = "GCP region for the interconnect"
  type        = string
}

variable "cloud_router_id" {
  description = "Cloud router ID"
  type        = string
}