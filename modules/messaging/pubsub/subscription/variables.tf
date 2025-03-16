variable "subscription_name" {
  description = "Name of the Pub/Sub subscription"
  type        = string
}

variable "topic_name" {
  description = "Name of the Pub/Sub topic"
  type        = string
}

variable "ack_deadline" {
  description = "Acknowledgment deadline in seconds"
  type        = number
  default     = 10
}