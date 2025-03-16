output "log_metric_id" {
  description = "The ID of the created log metric"
  value       = google_logging_metric.log_metric.id
}