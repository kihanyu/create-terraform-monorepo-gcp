resource "google_workspace_notebook_instance" "instance" {
  name               = var.instance_name
  machine_type      = var.machine_type
  region            = var.region

  lifecycle {
    prevent_destroy = true
  }
}