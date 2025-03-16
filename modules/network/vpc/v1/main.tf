resource "google_compute_network" "vpc_network" {
  name                    = var.name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  count = length(var.subnetworks)

  name          = element(var.subnetworks, count.index)["name"]
  ip_cidr_range = element(var.subnetworks, count.index)["cidr"]
  region        = var.region
  network       = google_compute_network.vpc_network.id
}