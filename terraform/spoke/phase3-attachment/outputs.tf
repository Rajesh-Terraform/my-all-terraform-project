output "spoke_tgw_attachment_id" {
  value = aws_ec2_transit_gateway_vpc_attachment.spoke.id
}

output "spoke_vpc_id" {
  value = data.terraform_remote_state.spoke_vpc.outputs.spoke_vpc_id
}

output "transit_gateway_id" {
  value = var.transit_gateway_id
}

  
