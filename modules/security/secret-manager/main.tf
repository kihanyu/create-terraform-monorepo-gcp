resource "google_secret_manager_secret" "secret" {
  secret_id = var.secret_id
  replication {
    user_managed {
      replicas {
        location = "us-central1"
      }
    }
  }
}