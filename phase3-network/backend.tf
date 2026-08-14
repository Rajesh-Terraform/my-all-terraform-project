terraform {
  required_version = "= 1.9.8"

  backend "s3" {
    bucket = "YOUR-HUB-TERRAFORM-STATE-BUCKET"

    key = "phase3-network/terraform.tfstate"

    region = "ap-south-1"

    encrypt = true
  }
}  