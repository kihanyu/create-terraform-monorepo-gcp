output "domain_mapping_id" {
  description = "The ID of the created domain mapping"
  value       = google_cloud_run_domain_mapping.domain_mapping.id
}