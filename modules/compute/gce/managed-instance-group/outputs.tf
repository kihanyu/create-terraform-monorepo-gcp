output "managed_group_id" {
  description = "The ID of the created managed instance group"
  value       = google_compute_region_instance_group_manager.managed_group.id
}

output "managed_group_name" {
  description = "The name of the managed instance group"
  value       = google_compute_region_instance_group_manager.managed_group.name
}