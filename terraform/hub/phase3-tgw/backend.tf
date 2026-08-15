terraform {
  backend "s3" {
    bucket       = "REPLACE_WITH_HUB_STATE_BUCKET"
    key          = "hub/phase3-tgw/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
} 