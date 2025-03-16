output "firewall_id" {
  description = "The ID of the created firewall rule"
  value       = google_compute_firewall.default.id
}