variable "vpc_cidr" {
  default     = "10.0.0.0/24"
}

variable "cidr_public_subnet" {
  description = "Public Subnet CIDR"
  default     = ["10.0.1.1/26", "10.0.1.2/26"]
}

variable "cidr_private_subnet" {
  description = "Private Subnet CIDR"
  default     = ["10.0.1.3/26", "10.0.1.4/26"]
}

variable "us-east_availability_zone" {
 description = "Availability Zones"
 default     = ["us-east-1a", "us-east-1b"]
}