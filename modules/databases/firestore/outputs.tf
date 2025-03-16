output "firestore_id" {
  description = "The ID of the created Firestore database"
  value       = google_firestore_database.firestore.id
}

output "firestore_project" {
  description = "The project ID of the Firestore database"
  value       = google_firestore_database.firestore.project
}