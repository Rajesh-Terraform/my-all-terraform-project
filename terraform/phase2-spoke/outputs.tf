output "spoke_vpc_id" {
  value = module.spoke.vpc_id
}

output "spoke_vpc_cidr" {
  value = module.spoke.vpc_cidr
}

output "spoke_private_subnet_ids" {
  value = module.spoke.private_subnet_ids
}