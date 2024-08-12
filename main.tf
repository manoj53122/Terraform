# provider "aws" {
#   region = "us-east-1"
# }


# # VPC Endpoint for SSM (Interface endpoint)
# resource "aws_vpc_endpoint" "ssm" {
#   vpc_id            = aws_vpc.main.id
#   service_name      = "com.amazonaws.us-east-1.ssm"
#   vpc_endpoint_type = "Interface"
#   subnet_ids        = [aws_subnet.private_1.id, aws_subnet.private_2.id]
#   security_group_ids = [aws_security_group.ec2_sg.id]
#   private_dns_enabled = true
# }

# # Your existing VPC Endpoint resources

# resource "aws_vpc_endpoint" "ssm_messages" {
#   vpc_id            = aws_vpc.main.id
#   service_name      = "com.amazonaws.us-east-1.ssmmessages"
#   vpc_endpoint_type = "Interface"
#   subnet_ids        = [aws_subnet.private_1.id, aws_subnet.private_2.id]
#   security_group_ids = [aws_security_group.ec2_sg.id]
#   private_dns_enabled = true
# }

# resource "aws_vpc_endpoint" "ec2_messages" {
#   vpc_id            = aws_vpc.main.id
#   service_name      = "com.amazonaws.us-east-1.ec2messages"
#   vpc_endpoint_type = "Interface"
#   subnet_ids        = [aws_subnet.private_1.id, aws_subnet.private_2.id]
#   security_group_ids = [aws_security_group.ec2_sg.id]
#   private_dns_enabled = true
# }


