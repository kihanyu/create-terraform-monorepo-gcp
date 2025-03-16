output "eventarc_trigger_id" {
  description = "The ID of the created Eventarc trigger"
  value       = google_eventarc_trigger.eventarc_trigger.id
}

output "eventarc_trigger_name" {
  description = "The name of the created Eventarc trigger"
  value       = google_eventarc_trigger.eventarc_trigger.name
}