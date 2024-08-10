# resource "aws_vpc_endpoint" "ssm" {
#   count      = length(var.cidr_private_subnet)
#   vpc_id = aws_vpc.main.id
#   service_name = "com.amazonaws.us-east-1.ssm"
#   subnet_ids = aws_subnet.private_subnets[*].id

# }

resource "aws_vpc_endpoint" "ssm" {
  vpc_id             = aws_vpc.main.id
  service_name       = "com.amazonaws.us-east-1.ssm"
  vpc_endpoint_type  = "Interface" # This is important
  subnet_ids         = aws_subnet.private_subnets[*].id

  security_group_ids = [aws_security_group.ec2_sg] # Optional, depending on your requirements
  private_dns_enabled = true
}


# resource "aws_vpc_endpoint" "ec2messages" {
#   vpc_id = aws_vpc.my_vpc.id
#   service_name = "com.amazonaws.us-east-1.ec2messages"
#   subnet_ids   = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
# }

# resource "aws_vpc_endpoint" "ssmmessages" {
#   vpc_id = aws_vpc.my_vpc.id
#   service_name = "com.amazonaws.us-east-1.ssmmessages"
#   subnet_ids   = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
# }
