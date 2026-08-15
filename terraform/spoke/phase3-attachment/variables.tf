variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "transit_gateway_id" {
  description = "Shared Hub Transit Gateway ID"
  type        = string
}

variable "hub_vpc_cidr" {
  description = "Hub VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}  