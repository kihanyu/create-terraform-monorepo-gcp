resource "google_filestore_instance" "filestore_instance" {
  name     = var.instance_name
  zone     = var.zone
  tier     = var.tier

  file_shares {
    name       = var.file_share_name
    capacity_gb = var.capacity_gb
  }

  networks {
    network = var.network
  }
}