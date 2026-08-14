output "hub_vpc_id" {
  description = "Hub VPC ID"

  value = module.vpc.vpc_id
}

output "hub_subnet_id" {
  description = "Hub subnet ID"

  value = module.vpc.subnet_id
}

output "hub_route_table_id" {
  description = "Hub route table ID"

  value = module.vpc.route_table_id
}