output "hub_vpc_id" {
  value = module.vpc.vpc_id
}

output "hub_vpc_cidr" {
  value = module.vpc.vpc_cidr
}

output "hub_private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "hub_private_route_table_id" {
  value = module.vpc.private_route_table_id
}

output "hub_public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}  