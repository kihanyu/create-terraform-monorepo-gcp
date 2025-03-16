resource "google_compute_instance" "vm_instance" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network
    access_config {
      # Allocate a one-to-one NAT IP to the instance
    }
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_key}"
  }
}