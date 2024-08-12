resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "NGW"
  }
}