resource "google_firestore_database" "firestore" {
  name     = var.database_id
  project  = var.project_id
  region   = var.region
  type     = "CLOUD_FIRESTORE" # or "FIRESTORE_IN_DATABASE" if needed
}