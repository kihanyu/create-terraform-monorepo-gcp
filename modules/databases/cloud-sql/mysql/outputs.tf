output "instance_id" {
  description = "The ID of the created SQL instance"
  value       = google_sql_database_instance.mysql_instance.id
}

output "instance_connection_name" {
  description = "The connection name of the SQL instance"
  value       = google_sql_database_instance.mysql_instance.connection_name
}