output "dashboard_id" {
  description = "The ID of the created dashboard"
  value       = google_monitoring_dashboard.dashboard.id
}