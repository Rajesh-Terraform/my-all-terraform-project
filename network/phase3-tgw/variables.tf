variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "hub_vpc_id" {
  type = string
}

variable "hub_vpc_cidr" {
  type = string
}

variable "hub_private_subnet_ids" {
  type = list(string)
}

variable "hub_private_route_table_ids" {
  type = list(string)
}

variable "spoke_vpc_id" {
  type = string
}

variable "spoke_vpc_cidr" {
  type = string
}

variable "spoke_private_subnet_ids" {
  type = list(string)
}

variable "spoke_private_route_table_ids" {
  type = list(string)
}

variable "spoke_account_id" {
  type = string
}

variable "same_organization" {
  type    = bool
  default = false
}  