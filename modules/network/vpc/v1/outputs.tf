output "vpc_id" {
  description = "The ID of the created VPC network"
  value       = google_compute_network.vpc_network.id
}

output "subnet_ids" {
  description = "List of IDs of created subnets"
  value       = google_compute_subnetwork.subnetwork[*].id
}