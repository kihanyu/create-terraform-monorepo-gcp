variable "connection_name" {
  description = "Name of the VPC Service Control connection"
  type        = string
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "resources" {
  description = "List of resources for the connection"
  type        = list(string)
}