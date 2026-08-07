variable "vpc_id" {
  description = "VPC ID"
  type        = string
}


variable "environment" {
  description = "Environment name"
  type        = string
}


variable "public_subnet_1_cidr" {
  description = "Public subnet AZ1 CIDR"
  type        = string
}


variable "public_subnet_2_cidr" {
  description = "Public subnet AZ2 CIDR"
  type        = string
}


variable "private_subnet_1_cidr" {
  description = "Private subnet AZ1 CIDR"
  type        = string
}


variable "private_subnet_2_cidr" {
  description = "Private subnet AZ2 CIDR"
  type        = string
}


variable "az_1" {
  type = string
}


variable "az_2" {
  type = string
}
