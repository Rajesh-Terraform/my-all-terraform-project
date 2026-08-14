terraform {
  required_version = "= 1.9.8"

  backend "s3" {
    bucket = "harish-gaddam-bucket123 "

    key = "phase3-network/terraform.tfstate"

    region = "ap-south-1"

    encrypt = true
  }
}  