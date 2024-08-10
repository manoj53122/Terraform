variable "vpc_cidr" {
  default     = "10.0.0.0/24"
}

variable "cidr_public_subnet" {
  description = "Public Subnet CIDR"
  default     = ["10.0.0.5/24", "10.0.0.6/24"]
}

variable "cidr_private_subnet" {
  description = "Private Subnet CIDR"
  default     = ["10.0.0.7/24", "10.0.0.8/24"]
}

variable "us-east_availability_zone" {
 description = "Availability Zones"
 default     = ["us-east-1a", "us-east-1b"]
}