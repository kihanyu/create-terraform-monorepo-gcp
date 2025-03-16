resource "google_bigtable_instance" "bigtable_instance" {
  instance_id = var.instance_id
  display_name = var.display_name
  project     = var.project
  cluster {
    cluster_id   = var.cluster_id
    location     = var.location
    serve_nodes  = var.serve_nodes
  }
}