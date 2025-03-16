resource "google_automl_dataset" "automl_dataset" {
  display_name = var.display_name
  dataset_type = "IMAGE"
}

resource "google_automl_model" "automl_model" {
  display_name = var.model_name
  dataset_id   = google_automl_dataset.automl_dataset.id
  model_type   = "CLOUD"
}