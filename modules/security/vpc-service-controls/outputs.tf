output "connection_id" {
  description = "The ID of the created VPC service control connection"
  value       = google_vpc_service_control_connection.vpc_service_control.id
}