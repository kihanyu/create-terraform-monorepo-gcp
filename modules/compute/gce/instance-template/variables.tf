variable "name" {
  description = "Name of the instance template"
  type        = string
}

variable "machine_type" {
  description = "Machine type to use for the instances"
  type        = string
}

variable "source_image" {
  description = "Source image for the boot disk"
  type        = string
}

variable "network" {
  description = "Network for the instances"
  type        = string
}