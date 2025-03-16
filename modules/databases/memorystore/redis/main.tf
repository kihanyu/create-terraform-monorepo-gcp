resource "google_redis_instance" "redis_instance" {
  name           = var.name
  tier           = "STANDARD_HA"
  memory_size_gb = var.memory_size
  region         = var.region

  auth_enabled = var.auth_enabled

  redis_version = "REDIS_6_X"
}