variable "vpc_name" {
  description = "Name of the spoke VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the spoke VPC"
  type        = string
}

variable "availability_zones" {
  description = "Availability zones for the spoke"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs"
  type        = list(string)
}