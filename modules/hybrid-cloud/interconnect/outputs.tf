output "interconnect_attachment_id" {
  description = "The ID of the created interconnect attachment"
  value       = google_compute_interconnect_attachment.interconnect_attachment.id
}