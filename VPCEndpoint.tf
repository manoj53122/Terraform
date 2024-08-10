resource "aws_vpc_attribute" "enable_dns_support" {
  vpc_id     = aws_vpc.main.id
  key        = "enableDnsSupport"
  value      = true
}

resource "aws_vpc_attribute" "enable_dns_hostnames" {
  vpc_id     = aws_vpc.main.id
  key        = "enableDnsHostnames"
  value      = true
}
