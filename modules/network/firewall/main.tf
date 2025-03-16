resource "google_compute_firewall" "default" {
  name    = var.name
  network = var.network

  allow {
    protocol = "tcp"
    ports    = var.tcp_ports
  }

  allow {
    protocol = "udp"
    ports    = var.udp_ports
  }

  source_ranges = var.source_ranges
}