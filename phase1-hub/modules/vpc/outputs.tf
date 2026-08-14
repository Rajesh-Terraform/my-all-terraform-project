output "vpc_id" {
  description = "VPC ID"

  value = aws_vpc.this.id
}

output "subnet_id" {
  description = "Private subnet ID"

  value = aws_subnet.private.id
}

output "route_table_id" {
  description = "Private route table ID"

  value = aws_route_table.private.id
} 