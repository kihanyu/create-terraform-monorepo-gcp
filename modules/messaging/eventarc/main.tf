resource "google_eventarc_trigger" "eventarc_trigger" {
  name     = var.trigger_name
  location = var.location

  destination {
    cloud_run_service {
      service = var.cloud_run_service
      region  = var.cloud_run_region
    }
  }

  filter {
    event_type = "google.pubsub.topic.publish"

    event_filters {
      attribute = "pubsubtopic"
      value     = var.pubsub_topic_id
    }
  }
}