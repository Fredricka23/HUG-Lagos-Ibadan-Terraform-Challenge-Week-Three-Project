variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}


variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}


variable "environment" {
  description = "Environment name"
  type        = string
}

variable "db_password" {

  description = "Database administrator password"

  type = string

  sensitive = true

}
