resource "aws_eip" "eip" {

  tags = {
    Name = "Demo_EIP"
  }
}