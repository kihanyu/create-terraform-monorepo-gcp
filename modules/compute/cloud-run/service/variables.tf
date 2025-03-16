variable "service_name" {
  description = "Name of the Cloud Run service"
  type        = string
}

variable "location" {
  description = "GCP location for the Cloud Run service"
  type        = string
}

variable "image" {
  description = "Container image to run"
  type        = string
}