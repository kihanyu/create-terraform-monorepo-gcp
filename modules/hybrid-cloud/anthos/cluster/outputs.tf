output "cluster_id" {
  description = "The ID of the created Anthos cluster"
  value       = google_container_cluster.anthos_cluster.id
}