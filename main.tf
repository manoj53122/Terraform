# provider "aws" {
#   region = "us-east-1"
# }

provider "aws" {
  region = "us-east-1" # Choose your desired region
}

# Create a VPC
provider "aws" {
  region = "us-east-1" # Choose your desired region
}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.10.10.0/24"
}

# Create public subnets
resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.10.0/26"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.10.64/26"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"
}

# Create private subnets
resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.10.128/26"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.10.192/26"
  availability_zone = "us-east-1b"
}

# The rest of your configuration remains the same


# Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

# Create an Elastic IP for the NAT Gateway
resource "aws_eip" "nat" {
}

# Create a NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_1.id
}

# Create a public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Associate public route table with public subnets
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

# Create a private route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
}

# Associate private route table with private subnets
resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id
}

# Create security group for EC2 instances
resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create security group for ALB
resource "aws_security_group" "alb_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create VPC endpoints for SSM
resource "aws_vpc_endpoint" "ssm" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.us-east-1.ssm"
  subnet_ids   = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}

resource "aws_vpc_endpoint" "ssm_messages" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.us-east-1.ssmmessages"
  subnet_ids   = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}

resource "aws_vpc_endpoint" "ec2_messages" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.us-east-1.ec2messages"
  subnet_ids   = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}

# # Create a private EC2 instance
# resource "aws_instance" "private_ec2" {
#   ami           = "ami-0c55b159cbfafe1f0" # Example AMI ID, update it to your preferred AMI
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.private_1.id
#   security_groups = [aws_security_group.ec2_sg.id]

#   user_data = <<-EOF
#               #!/bin/bash
#               sudo yum update -y
#               sudo yum install -y python3 java-1.8.0-openjdk
#               EOF
# }

# # Create an ALB
# resource "aws_lb" "app_lb" {
#   name               = "app-lb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.alb_sg.id]
#   subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id]
# }

# resource "aws_lb_target_group" "ec2_tg" {
#   name     = "ec2-tg"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.main.id
# }

# resource "aws_lb_listener" "http_listener" {
#   load_balancer_arn = aws_lb.app_lb.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.ec2_tg.arn
#   }
# }

# resource "aws_lb_target_group_attachment" "ec2" {
#   target_group_arn = aws_lb_target_group.ec2_tg.arn
#   target_id        = aws_instance.private_ec2.id
#   port             = 80
# }
