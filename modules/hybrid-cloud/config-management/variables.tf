variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "location" {
  description = "Location for the config management"
  type        = string
}

variable "git_sync_repo" {
  description = "The Git repo for configuration sync"
  type        = string
}

variable "git_sync_branch" {
  description = "The branch of the Git repo"
  type        = string
}