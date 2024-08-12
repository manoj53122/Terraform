resource "aws_instance" "private_instance" {
  ami           = "ami-04a81a99f5ec58529"  # Replace with the appropriate AMI ID
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