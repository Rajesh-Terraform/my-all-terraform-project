resource "aws_ec2_transit_gateway" "this" {
  description = var.name

  amazon_side_asn = 64512

  auto_accept_shared_attachments = "enable"

  default_route_table_association = "enable"

  default_route_table_propagation = "enable"

  dns_support = "enable"

  vpn_ecmp_support = "enable"

  tags = merge(
    var.tags,
    {
      Name = var.name
    }
  )
}

# ------------------------------------------------------------
# RAM RESOURCE SHARE
# ------------------------------------------------------------

resource "aws_ram_resource_share" "this" {
  name = "${var.name}-ram-share"

  allow_external_principals = var.allow_external_principals

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-ram-share"
    }
  )
}

# ------------------------------------------------------------
# SHARE TGW
# ------------------------------------------------------------

resource "aws_ram_resource_association" "tgw" {
  resource_share_arn = aws_ram_resource_share.this.arn
  resource_arn       = aws_ec2_transit_gateway.this.arn
}

# ------------------------------------------------------------
# SHARE WITH SPOKE ACCOUNT
# ------------------------------------------------------------

resource "aws_ram_principal_association" "spoke" {
  resource_share_arn = aws_ram_resource_share.this.arn
  principal          = var.spoke_account_id
}  