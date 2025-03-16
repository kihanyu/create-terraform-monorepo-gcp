output "vpc_id" {
  description = "The ID of the created VPC"
  value       = google_compute_network.vpc.id
}

output "subnetwork_ids" {
  description = "A map of IDs of the created subnets"
  value       = { for s in google_compute_subnetwork.subnets : s.key => s.id }
}