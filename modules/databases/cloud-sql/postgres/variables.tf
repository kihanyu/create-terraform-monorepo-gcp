variable "name" {
  description = "Name of the Cloud SQL instance"
  type        = string
}

variable "region" {
  description = "GCP region for the Cloud SQL instance"
  type        = string
  default     = "us-central1"
}

variable "authorized_network" {
  description = "IP address authorization for the SQL instance"
  type        = string
}