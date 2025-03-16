resource "google_eventarc_trigger" "eventarc_trigger" {
  name     = var.trigger_name
  location = var.location

  destination {
    cloud_run_service {
      service = var.cloud_run_service
      region  = var.cloud_run_region
    }
  }

  matching_criteria {
    attribute = "type"
    value     = "google.pubsub.topic.publish"
  }

  matching_criteria {
    attribute = "pubsubtopic"
    value     = var.pubsub_topic_id
  }
}