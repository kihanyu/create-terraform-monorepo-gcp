output "log_sink_id" {
  description = "The ID of the created log sink"
  value       = google_logging_project_sink.log_sink.id
}