resource "google_vpc_service_control_connection" "vpc_service_control" {
  name   = var.connection_name
  project = var.project_id
  resources {
    resources = var.resources
  }
}