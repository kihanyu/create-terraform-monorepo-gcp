variable "name" {
  description = "Name of the peering"
  type        = string
}

variable "network" {
  description = "Network to establish peering with"
  type        = string
}

variable "peer_network" {
  description = "The peer network to connect to"
  type        = string
}