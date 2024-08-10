output "id" {
  value = aws_vpc.main.cidr_block
}

output "IGW" {
  value = aws_internet_gateway.public_internet_gateway.id
}