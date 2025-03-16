variable "sink_name" {
  description = "The name of the log sink"
  type        = string
}

variable "destination" {
  description = "The destination for logs (e.g., Pub/Sub topic)"
  type        = string
}

variable "filter" {
  description = "Filter to apply for the logs"
  type        = string
  default     = ""
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}