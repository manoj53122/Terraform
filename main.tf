resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc : test-us-east-1"
  }
}
resource "aws_subnet" "public_subnets" {
  count      = length(var.cidr_public_subnet)
  vpc_id     = aws_vpc.vpc_cidr
  cidr_block = element(var.cidr_public_subnet, count.index)
  availability_zone = element(var.us-east_availability_zone, count.index)

  tags = {
    Name = "Subnet-Public : Public Subnet ${count.index + 1}"
  }
}