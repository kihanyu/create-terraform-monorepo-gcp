variable "name" {
  description = "Name of the Memcached instance"
  type        = string
}

variable "tier" {
  description = "Memcached tier"
  type        = string
}

variable "region" {
  description = "GCP region for the Memcache instance"
  type        = string
}

variable "zone" {
  description = "GCP zone for the instance"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the Memcached instance"
  type        = number
}

variable "idle_timeout" {
  description = "Idle timeout for Memcached nodes"
  type        = string
}