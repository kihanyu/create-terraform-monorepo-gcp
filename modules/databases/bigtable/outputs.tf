output "bigtable_instance_id" {
  description = "The ID of the created Bigtable instance"
  value       = google_bigtable_instance.bigtable_instance.id
}