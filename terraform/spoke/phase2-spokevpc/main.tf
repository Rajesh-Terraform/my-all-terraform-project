module "vpc" {
  source = "../../modules/vpc"

  name = "spoke-vpc"

  vpc_cidr = "10.1.0.0/16"

  availability_zones = [
    "us-east-1a",
    "us-east-1b"
  ]

  public_subnet_cidrs = [
    "10.1.1.0/24",
    "10.1.2.0/24"
  ]

  private_subnet_cidrs = [
    "10.1.101.0/24",
    "10.1.102.0/24"
  ]

  tags = {
    Environment = "production"
    Network     = "spoke"
  }
} 