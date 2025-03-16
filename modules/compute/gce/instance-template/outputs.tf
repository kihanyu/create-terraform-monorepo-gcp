output "template_id" {
  description = "The ID of the created instance template"
  value       = google_compute_instance_template.template.id
}