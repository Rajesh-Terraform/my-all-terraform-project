# ------------------------------------------------------------
# READ HUB VPC STATE
# ------------------------------------------------------------

data "terraform_remote_state" "hub_vpc" {
  backend = "s3"

  config = {
    bucket = "REPLACE_WITH_HUB_STATE_BUCKET"
    key    = "hub/phase1-hubvpc/terraform.tfstate"
    region = "us-east-1"
  }
}

# ------------------------------------------------------------
# TRANSIT GATEWAY
# ------------------------------------------------------------

module "transit_gateway" {
  source = "../../modules/transit-gateway"

  name = "hub-tgw"

  spoke_account_id = var.spoke_account_id

  allow_external_principals = var.allow_external_principals

  tags = {
    Environment = "production"
    Network     = "hub-spoke"
  }
}

# ------------------------------------------------------------
# HUB -> SPOKE ROUTE
# ------------------------------------------------------------

resource "aws_route" "hub_to_spoke" {
  route_table_id = data.terraform_remote_state.hub_vpc.outputs.hub_private_route_table_id

  destination_cidr_block = var.spoke_vpc_cidr

  transit_gateway_id = module.transit_gateway.transit_gateway_id

  depends_on = [
    module.transit_gateway
  ]
}  