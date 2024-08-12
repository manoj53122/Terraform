resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.10.0/26"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name = "Demo_Public Subnet1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.10.64/26"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"
  tags = {
    Name = "Demo_Public Subnet2"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.10.128/27"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Demo_Private Subnet1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.10.160/27"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Demo_Private Subnet2"
  
}
}