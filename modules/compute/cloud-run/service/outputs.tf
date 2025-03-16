output "service_id" {
  description = "The ID of the created Cloud Run service"
  value       = google_cloud_run_service.service.id
}

output "service_url" {
  description = "The URL of the Cloud Run service"
  value       = google_cloud_run_service.service.status[0].uri
}