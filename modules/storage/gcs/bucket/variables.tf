variable "name" {
  description = "Name of the GCS bucket"
  type        = string
}

variable "location" {
  description = "GCS bucket location"
  type        = string
  default     = "US"
}

variable "storage_class" {
  description = "Storage class for the bucket"
  type        = string
  default     = "STANDARD"
}

variable "versioning" {
  description = "Enable versioning for the bucket"
  type        = bool
  default     = false
}