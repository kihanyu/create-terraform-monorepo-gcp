output "filestore_instance_id" {
  description = "The ID of the created Filestore instance"
  value       = google_filestore_instance.filestore_instance.id
}

output "filestore_instance_name" {
  description = "The name of the created Filestore instance"
  value       = google_filestore_instance.filestore_instance.name
}