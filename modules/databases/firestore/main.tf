resource "google_firestore_database" "firestore" {
  name     = var.database_id
  project  = var.project_id
  location_id = var.location_id
  type     = "CLOUD_FIRESTORE" # or "FIRESTORE_IN_DATABASE" if needed
}