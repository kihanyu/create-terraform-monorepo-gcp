resource "google_pubsub_subscription" "subscription" {
  name  = var.subscription_name
  topic = var.topic_name

  ack_deadline_seconds = var.ack_deadline
}