resource "google_container_cluster" "anthos_cluster" {
  name               = var.cluster_name
  location           = var.location
  initial_node_count = var.initial_node_count
  networking_mode    = "VPC_NATIVE"

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
}