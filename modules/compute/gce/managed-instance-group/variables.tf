variable "name" {
  description = "Name of the managed instance group"
  type        = string
}

variable "region" {
  description = "Region for the managed instance group"
  type        = string
}

variable "target_size" {
  description = "Number of instances to manage"
  type        = number
}