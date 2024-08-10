# resource "aws_security_group" "alb_sg" {
#   name        = "alb_sg"
#   description = "Allow inbound traffic on port 80 only from the ALB security group."
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "alb_sg"
#   }
# }
