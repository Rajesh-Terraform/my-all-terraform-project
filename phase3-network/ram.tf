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

  resource_arn = aws_ec2_transit_gateway.this.arn

  resource_share_arn = aws_ram_resource_share.tgw.arn
}



resource "aws_ram_principal_association" "spoke" {
  provider = aws.hub

  principal = var.spoke_account_id

  resource_share_arn = aws_ram_resource_share.tgw.arn
} 