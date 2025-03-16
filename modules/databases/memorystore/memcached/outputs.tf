output "memcached_instance_id" {
  description = "The ID of the created Memcached instance"
  value       = google_memorystore_memcache_instance.memcached_instance.id
}