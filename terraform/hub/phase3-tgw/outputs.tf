output "transit_gateway_id" {
  value = module.transit_gateway.transit_gateway_id
}

output "transit_gateway_arn" {
  value = module.transit_gateway.transit_gateway_arn
}

output "transit_gateway_route_table_id" {
  value = module.transit_gateway.transit_gateway_route_table_id
}

output "ram_share_arn" {
  value = module.transit_gateway.ram_share_arn
}

output "hub_vpc_id" {
  value = data.terraform_remote_state.hub_vpc.outputs.hub_vpc_id
}  


  