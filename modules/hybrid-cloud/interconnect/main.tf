resource "google_compute_interconnect_attachment" "interconnect_attachment" {
  name                      = var.name
  interconnect            = var.interconnect_id
  region                  = var.region
  cloud_router_id         = var.cloud_router_id
}