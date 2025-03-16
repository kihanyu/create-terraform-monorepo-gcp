variable "instance_id" {
  description = "ID of the Bigtable instance"
  type        = string
}

variable "display_name" {
  description = "Display name for the Bigtable instance"
  type        = string
}

variable "project" {
  description = "The project ID"
  type        = string
}

variable "cluster_id" {
  description = "ID of the cluster"
  type        = string
}

variable "location" {
  description = "Location for the cluster"
  type        = string
}

variable "serve_nodes" {
  description = "Number of nodes for serving"
  type        = number
}