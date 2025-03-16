resource "google_logging_project_sink" "log_sink" {
  name        = var.sink_name
  destination = var.destination
  project     = var.project_id

  filter = var.filter
}