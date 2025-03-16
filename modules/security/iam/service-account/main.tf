variable "service_account_id" {
  description = "The service account ID"
  type        = string
}

variable "display_name" {
  description = "The display name for the service account"
  type        = string
}

variable "role" {
  description = "IAM role to assign to the service account"
  type        = string
}

variable "project_id" {
  description = "Project ID where the service account will be created"
  type        = string
}