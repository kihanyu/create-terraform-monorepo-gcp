output "zone_id" {
  description = "The ID of the created managed zone"
  value       = google_dns_managed_zone.default.id
}