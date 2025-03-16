output "bigtable_instance_id" {
  description = "The ID of the created Bigtable instance"
  value       = google_bigtable_instance.bigtable_instance.id
}

output "bigtable_display_name" {
  description = "The display name of the created Bigtable instance"
  value       = google_bigtable_instance.bigtable_instance.display_name
}