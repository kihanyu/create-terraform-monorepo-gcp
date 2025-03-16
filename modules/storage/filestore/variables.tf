variable "instance_name" {
  description = "The name of the Filestore instance"
  type        = string
}

variable "location" {
  description = "The location where the Filestore instance will be created"
  type        = string
}

variable "tier" {
  description = "The tier of the Filestore instance (e.g., STANDARD, PREMIUM)"
  type        = string
}

variable "file_share_name" {
  description = "The name of the file share"
  type        = string
}

variable "capacity_gb" {
  description = "The capacity of the file share in GB"
  type        = number
}

variable "network" {
  description = "The network where the Filestore instance will be created"
  type        = string
}

variable "modes" {
  description = "The modes of the network (e.g., SINGLE_IP_OR_SUBNET)"
  type        = list(string)
}