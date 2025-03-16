output "subscription_id" {
  description = "The ID of the created Pub/Sub subscription"
  value       = google_pubsub_subscription.subscription.id
}