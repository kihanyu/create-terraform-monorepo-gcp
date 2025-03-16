resource "google_sql_database_instance" "mysql_instance" {
  name             = var.name
  database_version = "MYSQL_5_7"
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