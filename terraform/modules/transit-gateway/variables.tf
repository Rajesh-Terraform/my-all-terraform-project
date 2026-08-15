variable "name" {
  description = "Transit Gateway name"
  type        = string
}

variable "spoke_account_id" {
  description = "AWS account ID of spoke account"
  type        = string
}

variable "allow_external_principals" {
  description = "Allow RAM sharing with accounts outside the AWS Organization"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}  