output "peering_id" {
  description = "The ID of the created peering"
  value       = google_compute_network_peering.peering.id
}