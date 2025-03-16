resource "google_compute_interconnect_attachment" "interconnect_attachment" {
  name                      = var.name
  interconnect            = var.interconnect_id
  region                  = var.region
  router                  = var.cloud_router_id
}