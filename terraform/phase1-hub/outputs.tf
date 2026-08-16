output "hub_vpc_id" {
  value = module.hub.vpc_id
}

output "hub_vpc_cidr" {
  value = module.hub.vpc_cidr
}

output "hub_public_subnet_ids" {
  value = module.hub.public_subnet_ids
}

output "hub_private_subnet_ids" {
  value = module.hub.private_subnet_ids
}

output "hub_tgw_attachment_subnet_ids" {
  value = module.hub.private_subnet_ids
}