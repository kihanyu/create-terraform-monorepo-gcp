resource "google_cloud_run_domain_mapping" "domain_mapping" {
  name     = var.domain_mapping_name
  location = var.location
  id       = var.domain_mapping_id

  spec {
    route_name = var.route_name
  }
}