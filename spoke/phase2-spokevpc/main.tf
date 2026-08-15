module "spoke_vpc" {
  source = "../../terraform/vpc"

  vpc_name = "spoke-vpc"
  vpc_cidr = "10.1.0.0/16"

  availability_zones = [
    "ap-south-1a",
    "ap-south-1b"
  ]

  public_subnet_cidrs = []

  private_subnet_cidrs = [
    "10.1.0.0/24",
    "10.1.1.0/24"
  ]

  create_igw         = false
  create_nat_gateway = false
}



resource "aws_ec2_transit_gateway_vpc_attachment" "spoke" {
  provider = aws.spoke

  transit_gateway_id = module.tgw.transit_gateway_id
  vpc_id             = var.spoke_vpc_id

  subnet_ids = var.spoke_private_subnet_ids

  dns_support = "enable"

  ipv6_support = "disable"

  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = {
    Name = "spoke-tgw-attachment"
  }

  depends_on = [
    aws_ram_principal_association.spoke
  ]
}


resource "aws_ec2_transit_gateway_route_table_propagation" "spoke_to_hub" {
  provider = aws.hub

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.spoke.id
  transit_gateway_route_table_id = module.tgw.hub_route_table_id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.hub,
    aws_ec2_transit_gateway_route_table_association.spoke
  ]
}

resource "aws_ec2_transit_gateway_route_table_propagation" "hub_to_spoke" {
  provider = aws.hub

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.hub.id
  transit_gateway_route_table_id = module.tgw.spoke_route_table_id

  depends_on = [
    aws_ec2_transit_gateway_route_table_association.hub,
    aws_ec2_transit_gateway_route_table_association.spoke
  ]
}  