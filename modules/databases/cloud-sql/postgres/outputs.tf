output "instance_id" {
  description = "The ID of the created SQL instance"
  value       = google_sql_database_instance.postgres_instance.id
}

output "instance_connection_name" {
  description = "The connection name of the SQL instance"
  value       = google_sql_database_instance.postgres_instance.connection_name
}