module "hub_vpc" {
  source = "../../terraform/vpc"

  vpc_name = "hub-vpc"
  vpc_cidr = "10.0.0.0/16"

  availability_zones = [
    "ap-south-1a",
    "ap-south-1b"
  ]

  public_subnet_cidrs = [
    "10.0.0.0/24",
    "10.0.1.0/24"
  ]

  private_subnet_cidrs = [
    "10.0.10.0/24",
    "10.0.11.0/24"
  ]

  create_igw         = true
  create_nat_gateway = true
}



resource "aws_ram_resource_share" "tgw" {
  provider = aws.hub

  name = "hub-spoke-tgw-share"

  allow_external_principals = true

  tags = {
    Name = "hub-spoke-tgw-share"
  }
}

resource "aws_ram_resource_association" "tgw" {
  provider = aws.hub

  resource_share_arn = aws_ram_resource_share.tgw.arn
  resource_arn       = module.tgw.transit_gateway_id
}

resource "aws_ram_principal_association" "spoke" {
  provider = aws.hub

  resource_share_arn = aws_ram_resource_share.tgw.arn
  principal          = var.spoke_account_id
}



resource "aws_ram_resource_share_accepter" "spoke" {
  provider = aws.spoke

  share_arn = aws_ram_resource_share.tgw.arn
}



resource "aws_ec2_transit_gateway_vpc_attachment" "hub" {
  provider = aws.hub

  transit_gateway_id = module.tgw.transit_gateway_id
  vpc_id             = var.hub_vpc_id

  subnet_ids = var.hub_private_subnet_ids

  dns_support = "enable"

  ipv6_support = "disable"

  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = {
    Name = "hub-tgw-attachment"
  }
}



resource "aws_ec2_transit_gateway_route_table_association" "hub" {
  provider = aws.hub

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.hub.id
  transit_gateway_route_table_id = module.tgw.hub_route_table_id
}

resource "aws_ec2_transit_gateway_route_table_association" "spoke" {
  provider = aws.hub

  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.spoke.id
  transit_gateway_route_table_id = module.tgw.spoke_route_table_id

  depends_on = [
    aws_ec2_transit_gateway_vpc_attachment.spoke
  ]
}  


module "hub_vpc" {
  source = "../../modules/vpc"

  # ...
}


