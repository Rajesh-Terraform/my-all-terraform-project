output "spoke_vpc_id" {
  value = module.vpc.vpc_id
}

output "spoke_vpc_cidr" {
  value = module.vpc.vpc_cidr
}

output "spoke_private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "spoke_private_route_table_id" {
  value = module.vpc.private_route_table_id
}

output "spoke_public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}  