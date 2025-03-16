variable "cluster_name" {
  description = "Name of the Anthos cluster"
  type        = string
}

variable "location" {
  description = "GCP location for the cluster"
  type        = string
  default     = "us-central1"
}

variable "initial_node_count" {
  description = "Initial node count in the cluster"
  type        = number
  default     = 1
}