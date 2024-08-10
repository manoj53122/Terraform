variable "vpc_cidr" {
  default     = "10.0.0.0/24"
}

variable "cidr_public_subnet" {
  description = "Public Subnet CIDR"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "cidr_private_subnet" {
  description = "Private Subnet CIDR"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "us-east_availability_zone" {
 description = "Availability Zones"
 default     = ["us-east-1", "us-east-2"]
}