variable "trigger_name" {
  description = "Name of the Eventarc trigger"
  type        = string
}

variable "location" {
  description = "GCP location for the Eventarc trigger"
  type        = string
}

variable "cloud_run_service" {
  description = "Name of the Cloud Run service to trigger"
  type        = string
}

variable "cloud_run_region" {
  description = "Region of the Cloud Run service"
  type        = string
}

variable "pubsub_topic_id" {
  description = "ID of the Pub/Sub topic to filter on"
  type        = string
}