resource "google_compute_region_instance_group_manager" "managed_group" {
  name                    = var.name
  region                  = var.region
  base_instance_name      = var.base_instance_name
  version {
    instance_template = google_compute_instance_template.template.id
  }
  target_size             = var.target_size
}