# resource "aws_internet_gateway" "public_internet_gateway"{
#   vpc_id = aws_vpc.main.id
#   tags = {
#     Name = "IGW: us-east-1"
#   }
# }
