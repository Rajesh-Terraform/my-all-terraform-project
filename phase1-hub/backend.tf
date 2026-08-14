terraform {
  required_version = "= 1.9.8"

  backend "s3" {
    bucket = "dhoni-demo-terraform-bucket-123456"

    key = "phase1-hub/terraform.tfstate"

    region = "ap-south-1"

    encrypt = true
  }
}  