variable "name" {
  description = "Name of the firewall rule"
  type        = string
}

variable "network" {
  description = "Network the firewall applies to"
  type        = string
}

variable "tcp_ports" {
  description = "List of TCP ports to allow"
  type        = list(string)
  default     = []
}

variable "udp_ports" {
  description = "List of UDP ports to allow"
  type        = list(string)
  default     = []
}

variable "source_ranges" {
  description = "List of source IP ranges to allow traffic from"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}