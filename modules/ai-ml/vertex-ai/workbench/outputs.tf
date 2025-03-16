output "instance_id" {
  description = "The ID of the created notebook instance"
  value       = google_workspace_notebook_instance.instance.id
}

output "instance_ip" {
  description = "The IP address of the created notebook instance"
  value       = google_workspace_notebook_instance.instance.network_interface[0].access_config[0].nat_ip
}