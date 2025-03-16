output "bucket_id" {
  description = "The ID of the created GCS bucket"
  value       = google_storage_bucket.bucket.id
}

output "bucket_name" {
  description = "The name of the created GCS bucket"
  value       = google_storage_bucket.bucket.name
}