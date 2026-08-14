output "vpc_id" {
  description = "Hub VPC ID"

  value = aws_vpc.this.id
}

output "subnet_id" {
  description = "Hub private subnet ID"

  value = aws_subnet.private.id
}

output "route_table_id" {
  description = "Hub private route table ID"

  value = aws_route_table.private.id
}