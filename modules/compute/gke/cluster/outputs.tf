output "cluster_id" {
  description = "The ID of the created GKE cluster"
  value       = google_container_cluster.gke_cluster.id
}

output "endpoint" {
  description = "Kubernetes API server endpoint"
  value       = google_container_cluster.gke_cluster.endpoint
}