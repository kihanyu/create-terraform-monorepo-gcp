output "keyring_id" {
  description = "The ID of the created keyring"
  value       = google_kms_key_ring.keyring.id
}