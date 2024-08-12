resource "aws_instance" "private_instance" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet_1.id
  security_groups = [aws_security_group.ec2_sg.name]
  associate_public_ip_address = false
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y python3 java
            EOF
}

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