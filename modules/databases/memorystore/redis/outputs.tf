output "instance_id" {
  description = "The ID of the created Redis instance"
  value       = google_redis_instance.redis_instance.id
}

output "host" {
  description = "The host of the Redis instance"
  value       = google_redis_instance.redis_instance.host
}