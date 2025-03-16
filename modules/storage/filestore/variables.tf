variable "instance_name" {
  description = "Name of the Filestore instance"
  type        = string
}

variable "zone" {
  description = "Zone for the Filestore instance"
  type        = string
}

variable "tier" {
  description = "Filestore tier"
  type        = string
  default     = "STANDARD"
}

variable "file_share_name" {
  description = "Name of the file share"
  type        = string
}

variable "capacity_gb" {
  description = "Capacity in GB of the file share"
  type        = number
}

variable "network" {
  description = "Network for the Filestore instance"
  type        = string
}