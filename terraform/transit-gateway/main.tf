resource "aws_ec2_transit_gateway" "this" {
  description = var.name

  amazon_side_asn = 64512

  auto_accept_shared_attachments = "enable"

  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  dns_support = "enable"

  vpn_ecmp_support = "enable"

  tags = {
    Name = var.name
  }
}

resource "aws_ec2_transit_gateway_route_table" "hub" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = {
    Name = "${var.name}-hub-rt"
  }
}

resource "aws_ec2_transit_gateway_route_table" "spoke" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = {
    Name = "${var.name}-spoke-rt"
  }
}  