output "interconnect_attachment_id" {
  description = "The ID of the created interconnect attachment"
  value       = google_compute_interconnect_attachment.interconnect_attachment.id
}

output "interconnect_attachment_name" {
  description = "The name of the created interconnect attachment"
  value       = google_compute_interconnect_attachment.interconnect_attachment.name
}