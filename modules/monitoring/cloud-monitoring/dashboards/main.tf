resource "google_monitoring_dashboard" "dashboard" {
  dashboard_json = jsonencode({
    displayName = var.display_name
    widgets     = var.widgets
  })
}