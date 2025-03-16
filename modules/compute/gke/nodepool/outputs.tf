output "node_pool_id" {
  description = "The ID of the created node pool"
  value       = google_container_node_pool.node_pool.id
}