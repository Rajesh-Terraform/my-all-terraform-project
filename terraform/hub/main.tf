resource "aws_vpc" "hub" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "hub-vpc"
  }
}  