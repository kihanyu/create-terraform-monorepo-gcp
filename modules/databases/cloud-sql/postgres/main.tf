resource "google_sql_database_instance" "postgres_instance" {
  name             = var.name
  database_version = "POSTGRES_13"
  region           = var.region

  settings {
    tier = "db-n1-standard-1"

    ip_configuration {
      authorized_networks {
        name  = "Public Access"
        value = var.authorized_network
      }
      ipv4_enabled = true
    }
  }
}