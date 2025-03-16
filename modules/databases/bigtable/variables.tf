variable "name" {
  description = "ID of the Bigtable instance"
  type        = string
}

variable "display_name" {
  description = "Display name for the Bigtable instance"
  type        = string
}

variable "project" {
  description = "The project ID where the Bigtable instance will be created"
  type        = string
}

variable "cluster_id" {
  description = "ID of the cluster within the Bigtable instance"
  type        = string
}

variable "zone" {
  description = "Zone where the Bigtable cluster will be located"
  type        = string
}

variable "num_nodes" {
  description = "Number of nodes to serve data in the cluster"
  type        = number
}