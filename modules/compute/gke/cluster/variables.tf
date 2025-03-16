variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "location" {
  description = "GCP location for the cluster"
  type        = string
}

variable "initial_node_count" {
  description = "Initial node count"
  type        = number
  default     = 3
}