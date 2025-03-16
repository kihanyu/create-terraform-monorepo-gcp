variable "name" {
  description = "Name of the managed instance group"
  type        = string
}

variable "region" {
  description = "Region where the managed instance group will reside"
  type        = string
}

variable "base_instance_name" {
  description = "Base name for the instances in the group"
  type        = string
}

variable "target_size" {
  description = "Number of instances to manage in the group"
  type        = number
}