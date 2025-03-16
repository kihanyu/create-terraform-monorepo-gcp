resource "google_compute_instance_template" "template" {
  name         = var.name
  machine_type = var.machine_type

  disk {
    source_image = var.source_image
  }

  network_interface {
    network = var.network
    access_config {
      // Optional: define access configuration here
    }
  }
}