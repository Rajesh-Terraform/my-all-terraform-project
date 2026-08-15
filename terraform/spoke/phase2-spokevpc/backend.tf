terraform {
  backend "s3" {
    bucket       = "harish-gaddam-bucket123"
    key          = "spoke/phase2-spokevpc/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}  