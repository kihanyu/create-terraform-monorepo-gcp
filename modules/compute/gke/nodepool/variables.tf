variable "cluster_id" {
  description = "ID of the GKE cluster"
  type        = string
}

variable "location" {
  description = "Location for the node pool"
  type        = string
}

variable "node_pool_name" {
  description = "Name of the node pool"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the pool"
  type        = number
  default     = 3
}

variable "machine_type" {
  description = "Machine type for the nodes"
  type        = string
}