output "service_account_id" {
  description = "The ID of the created service account"
  value       = google_service_account.sa.id
}

output "service_account_email" {
  description = "The email of the created service account"
  value       = google_service_account.sa.email
}