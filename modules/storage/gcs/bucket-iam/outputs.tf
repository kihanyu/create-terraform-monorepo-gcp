output "bucket_iam_member_id" {
  description = "The ID of the created IAM member for the bucket"
  value       = google_storage_bucket_iam_member.bucket_iam.id
}