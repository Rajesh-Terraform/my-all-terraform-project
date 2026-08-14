output "hub_vpc_id" {
  value = module.vpc.vpc_id
}

output "hub_subnet_id" {
  value = module.vpc.subnet_id
}

output "hub_route_table_id" {
  value = module.vpc.route_table_id
}