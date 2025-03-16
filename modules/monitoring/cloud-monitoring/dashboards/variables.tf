variable "display_name" {
  description = "Dashboard display name"
  type        = string
}

variable "widgets" {
  description = "List of widgets for this dashboard"
  type        = list(any)
}