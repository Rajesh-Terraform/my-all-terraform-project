provider "aws" {
  alias  = "hub"
  region = var.aws_region
}

provider "aws" {
  alias  = "spoke"
  region = var.aws_region
}


module "tgw" {
  source = "../../terraform/transit-gateway"

  providers = {
    aws = aws.hub
  }

  name = "hub-spoke-tgw"
}  