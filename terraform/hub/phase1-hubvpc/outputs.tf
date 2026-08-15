output "hub_vpc_id" {
  description = "Hub VPC ID"
  value       = module.vpc.vpc_id
}

output "hub_vpc_cidr" {
  description = "Hub VPC CIDR"
  value       = module.vpc.vpc_cidr
}

output "public_subnet_ids" {
  description = "Hub public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Hub private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "internet_gateway_id" {
  description = "Hub Internet Gateway ID"
  value       = module.vpc.internet_gateway_id
}