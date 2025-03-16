resource "google_container_cluster" "gke_cluster" {
  name               = var.cluster_name
  location           = var.location
  initial_node_count = var.initial_node_count
  remove_default_node_pool = true

  node_pool {
    name               = "default-pool"
    initial_node_count = var.initial_node_count

    node_config {
      machine_type = "e2-medium"
    }
  }
}