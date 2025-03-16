variable "name" {
  description = "Name of the interconnect attachment"
  type        = string
}

variable "interconnect_id" {
  description = "ID of the interconnect to attach"
  type        = string
}

variable "region" {
  description = "Region where the interconnect attachment resides"
  type        = string
}

variable "cloud_router_id" {
  description = "ID of the cloud router to associate with the interconnect attachment"
  type        = string
}