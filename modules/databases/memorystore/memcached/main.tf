resource "google_memorystore_memcache_instance" "memcached_instance" {
  name               = var.name
  tier               = var.tier
  region             = var.region
  zone               = var.zone
  memcache_node_count = var.node_count

  parameters {
    idle_timeout = var.idle_timeout
  }
}