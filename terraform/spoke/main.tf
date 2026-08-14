resource "aws_vpc" "spoke" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "spoke-vpc"
  }
}  