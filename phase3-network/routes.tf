resource "aws_ec2_transit_gateway_route_table" "hub" {
  provider = aws.hub

  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = {
    Name = "hub-tgw-route-table"
  }
}


resource "aws_ec2_transit_gateway_route_table" "spoke" {
  provider = aws.hub

  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = {
    Name = "spoke-tgw-route-table"
  }
}


resource "aws_route" "hub_to_spoke" {
  provider = aws.hub

  route_table_id = var.hub_route_table_id

  destination_cidr_block = "10.1.0.0/16"

  transit_gateway_id = aws_ec2_transit_gateway.this.id
}  


resource "aws_route" "spoke_to_hub" {
  provider = aws.spoke

  route_table_id = var.spoke_route_table_id

  destination_cidr_block = "10.0.0.0/16"

  transit_gateway_id = aws_ec2_transit_gateway.this.id
}