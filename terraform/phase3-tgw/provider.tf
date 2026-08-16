terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  alias  = "hub"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "spoke"
  region = "ap-south-1"
}