variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "pvt_subnet_az" {
  description = "Availability Zone for private subnet"
  type        = string
  default     = "ap-south-1a"
}

variable "pvt_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "pub_subnet_az" {
  description = "Availability Zone for public subnet"
  type        = string
  default     = "ap-south-1b"
}

variable "pub_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.2.0/24"
}











