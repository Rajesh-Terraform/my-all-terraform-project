terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  alias  = "hub"
  region = var.aws_region
}

provider "aws" {
  alias  = "spoke"
  region = var.aws_region

  assume_role {
    role_arn = var.spoke_role_arn
  }
}  