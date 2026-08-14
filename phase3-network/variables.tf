variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "spoke_account_id" {
  type = string
}

variable "spoke_role_arn" {
  type = string
}

variable "hub_vpc_id" {
  type = string
}

variable "hub_subnet_id" {
  type = string
}

variable "spoke_vpc_id" {
  type = string
}

variable "spoke_subnet_id" {
  type = string
}


variable "hub_route_table_id" {
  type = string
}

variable "spoke_route_table_id" {
  type = string
}  