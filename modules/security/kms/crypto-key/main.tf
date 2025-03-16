resource "google_kms_crypto_key" "crypto_key" {
  name     = var.crypto_key_name
  key_ring = var.keyring_id
  purpose  = "ENCRYPT_DECRYPT"
}