resource "aws_vpc" "main" {
  cidr_block = "10.10.10.0/24"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Demo_vpc"
  }
}