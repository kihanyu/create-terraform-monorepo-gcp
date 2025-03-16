output "vpc_id" {
  description = "The ID of the created VPC from the module"
  value       = module.vpc.vpc_id
}

output "subnetwork_ids" {
  description = "The IDs of the created subnets from the module"
  value       = module.vpc.subnetwork_ids
}