resource "google_dns_managed_zone" "default" {
  name     = var.name
  dns_name = var.dns_name
}