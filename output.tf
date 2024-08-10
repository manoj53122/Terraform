output "id" {
  value = aws_vpc.main.cidr_block
}

output "IGW" {
  value = aws.aws_internet_gateway
}