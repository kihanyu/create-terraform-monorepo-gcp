variable "name" {
  description = "Name of the Redis instance"
  type        = string
}

variable "memory_size" {
  description = "Memory size for Redis instance in GB"
  type        = number
  default     = 1
}

variable "region" {
  description = "GCP region for the Redis instance"
  type        = string
}

variable "auth_enabled" {
  description = "Enable or disable Redis AUTH"
  type        = bool
  default     = true
}