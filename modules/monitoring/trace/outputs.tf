output "trace_id" {
  description = "The ID of the created trace"
  value       = google_tracing_trace.trace.trace_id
}