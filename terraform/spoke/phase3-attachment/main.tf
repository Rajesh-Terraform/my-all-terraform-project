# ------------------------------------------------------------
# READ SPOKE VPC STATE
# ------------------------------------------------------------

data "terraform_remote_state" "spoke_vpc" {
  backend = "s3"

  config = {
    bucket = "REPLACE_WITH_SPOKE_STATE_BUCKET"
    key    = "spoke/phase2-spokevpc/terraform.tfstate"
    region = "ap-south-1"
  }
}

# ------------------------------------------------------------
# CREATE TGW VPC ATTACHMENT
# ------------------------------------------------------------

resource "aws_ec2_transit_gateway_vpc_attachment" "spoke" {
  transit_gateway_id = var.transit_gateway_id

  vpc_id = data.terraform_remote_state.spoke_vpc.outputs.spoke_vpc_id

  subnet_ids = data.terraform_remote_state.spoke_vpc.outputs.spoke_private_subnet_ids

  dns_support = "enable"

  ipv6_support = "disable"

  transit_gateway_default_route_table_association = true

  transit_gateway_default_route_table_propagation = true

  tags = {
    Name        = "spoke-to-hub-tgw"
    Environment = "production"
    Network     = "hub-spoke"
  }
}

# ------------------------------------------------------------
# SPOKE -> HUB ROUTE
# ------------------------------------------------------------

resource "aws_route" "spoke_to_hub" {
  route_table_id = data.terraform_remote_state.spoke_vpc.outputs.spoke_private_route_table_id

  destination_cidr_block = var.hub_vpc_cidr

  transit_gateway_id = var.transit_gateway_id

  depends_on = [
    aws_ec2_transit_gateway_vpc_attachment.spoke
  ]
}  