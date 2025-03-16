output "automl_dataset_id" {
  description = "The ID of the created Automl dataset"
  value       = google_automl_dataset.automl_dataset.id
}

output "automl_model_id" {
  description = "The ID of the created Automl model"
  value       = google_automl_model.automl_model.id
}