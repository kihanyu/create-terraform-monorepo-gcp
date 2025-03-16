resource "google_bigtable_instance" "bigtable_instance" {
  name         = var.name
  display_name = var.display_name
  project      = var.project
  cluster {
    cluster_id   = var.cluster_id
    zone         = var.zone
    num_nodes    = var.num_nodes
  }
}