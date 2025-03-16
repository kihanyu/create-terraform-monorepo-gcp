variable "name" {
  description = "Name of the instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type to use for the instance"
  type        = string
  default     = "e2-medium"
}

variable "zone" {
  description = "GCP zone for the instance"
  type        = string
  default     = "us-central1-a"
}

variable "image" {
  description = "Image to be used for boot disk"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "network" {
  description = "Network to attach the instance"
  type        = string
}

variable "ssh_user" {
  description = "SSH user for accessing the instance"
  type        = string
}

variable "ssh_key" {
  description = "SSH public key for authentication"
  type        = string
}