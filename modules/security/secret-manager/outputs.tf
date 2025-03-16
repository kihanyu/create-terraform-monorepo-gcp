output "secret_id" {
  description = "The ID of the created secret"
  value       = google_secret_manager_secret.secret.id
}