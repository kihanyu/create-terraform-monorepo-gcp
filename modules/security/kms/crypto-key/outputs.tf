output "crypto_key_id" {
  description = "The ID of the created crypto key"
  value       = google_kms_crypto_key.crypto_key.id
}