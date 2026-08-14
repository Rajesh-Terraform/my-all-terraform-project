output "spoke_vpc_id" {
  value = module.vpc.vpc_id
}

output "spoke_subnet_id" {
  value = module.vpc.subnet_id
}

output "spoke_route_table_id" {
  value = module.vpc.route_table_id
}  