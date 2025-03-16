resource "google_cloud_run_domain_mapping" "domain_mapping" {
  service = var.service_name
  location = var.location
  id = var.domain_mapping_id
}