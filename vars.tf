variable "vpc_cidr" {
  default     = "10.0.0.0/24"
}

variable "cidr_public_subnet" {
  description = "Public Subnet CIDR"
  default     = ["10.0.0.0/26", "10.0.0.65/26"]
}

variable "cidr_private_subnet" {
  description = "Private Subnet CIDR"
  default     = ["10.0.0.129/26", "10.0.0.193/26"]
}

variable "us-east_availability_zone" {
 description = "Availability Zones"
 default     = ["us-east-1a", "us-east-1b"]
}