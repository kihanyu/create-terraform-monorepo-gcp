resource "google_storage_bucket_iam_member" "bucket_iam" {
  bucket = var.bucket_name
  role   = var.role
  member = var.member
}