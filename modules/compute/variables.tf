variable "subnet_id" {
  description = "Public subnet ID for EC2"
  type        = string
}


variable "security_group_id" {
  description = "EC2 security group ID"
  type        = string
}


variable "environment" {
  description = "Environment name"
  type        = string
}


variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}


variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}
