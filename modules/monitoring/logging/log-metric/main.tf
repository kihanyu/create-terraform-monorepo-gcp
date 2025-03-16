resource "google_logging_metric" "log_metric" {
  name        = var.metric_name
  description = var.description
  filter      = var.filter
}