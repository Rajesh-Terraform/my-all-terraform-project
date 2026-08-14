terraform {
  backend "s3" {
    bucket = "harish-gaddam-bucket123"

    key = "spoke/terraform.tfstate"

    region = "ap-south-1"
  }
}  