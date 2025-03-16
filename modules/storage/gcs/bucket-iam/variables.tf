variable "bucket_name" {
  description = "Name of the GCS bucket"
  type        = string
}

variable "role" {
  description = "IAM role to assign"
  type        = string
}

variable "member" {
  description = "The member to assign the role to"
  type        = string
}