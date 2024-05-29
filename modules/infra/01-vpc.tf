resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}

output "vpc_id" {
  description = "The ID of the main VPC"
  value       = aws_vpc.main.id
}