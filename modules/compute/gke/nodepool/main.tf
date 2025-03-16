resource "google_container_node_pool" "node_pool" {
  cluster    = var.cluster_id
  location   = var.location
  name       = var.node_pool_name

  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
  }
}