resource "google_cloud_run_service" "service" {
  name     = var.service_name
  location = var.location

  template {
    spec {
      containers {
        image = var.image
      }
    }
  }
}