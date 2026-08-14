resource "aws_ec2_transit_gateway" "this" {
  provider = aws.hub

  description = "Hub-Spoke Transit Gateway"

  amazon_side_asn = 64512

  dns_support = "enable"

  vpn_ecmp_support = "enable"

  default_route_table_association = "disable"

  default_route_table_propagation = "disable"

  auto_accept_shared_attachments = "enable"

  tags = {
    Name = "hub-spoke-tgw"
  }
}



resource "aws_ec2_transit_gateway_vpc_attachment" "hub" {
  provider = aws.hub

  transit_gateway_id = aws_ec2_transit_gateway.this.id

  vpc_id = var.hub_vpc_id

  subnet_ids = [
    var.hub_subnet_id
  ]

  dns_support = "enable"

  ipv6_support = "disable"

  tags = {
    Name = "hub-tgw-attachment"
  }
}



resource "aws_ec2_transit_gateway_vpc_attachment" "spoke" {
  provider = aws.spoke

  transit_gateway_id = aws_ec2_transit_gateway.this.id

  vpc_id = var.spoke_vpc_id

  subnet_ids = [
    var.spoke_subnet_id
  ]

  dns_support = "enable"

  ipv6_support = "disable"

  tags = {
    Name = "spoke-tgw-attachment"
  }

  depends_on = [
    aws_ram_principal_association.spoke
  ]
} 