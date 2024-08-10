# resource "aws_subnet" "public_subnets" {
#   count      = length(var.cidr_public_subnet)
#   vpc_id     = aws_vpc.main.id
#   cidr_block = element(var.cidr_public_subnet, count.index)
#   availability_zone = element(var.us-east_availability_zone, count.index)

#   tags = {
#     Name = "Subnet-Public : Public Subnet_${count.index + 1}"
#   }
# }

# resource "aws_subnet" "private_subnets" {
#   count      = length(var.cidr_private_subnet)
#   vpc_id     = aws_vpc.main.id
#   cidr_block = element(var.cidr_private_subnet, count.index)
#   availability_zone = element(var.us-east_availability_zone, count.index)

#   tags = {
#     Name = "Subnet-Private : Private Subnet_${count.index + 1}"
#   }
# }