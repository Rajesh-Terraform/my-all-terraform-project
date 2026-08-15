variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "spoke_account_id" {
  description = "Spoke AWS account ID"
  type        = string
}

variable "spoke_vpc_cidr" {
  description = "Spoke VPC CIDR"
  type        = string
  default     = "10.1.0.0/16"
}

variable "allow_external_principals" {
  description = "Allow RAM sharing outside AWS Organization"
  type        = bool
  default     = true
}  