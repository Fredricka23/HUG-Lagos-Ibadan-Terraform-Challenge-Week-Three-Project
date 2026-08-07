variable "environment" {

  description = "Environment name"

  type = string

}


variable "subnet_ids" {

  description = "Private subnet IDs for database subnet group"

  type = list(string)

}


variable "security_group_id" {

  description = "Database security group ID"

  type = string

}


variable "db_instance_class" {

  description = "Database instance class"

  type = string

  default = "db.t3.micro"

}


variable "allocated_storage" {

  description = "Database storage size"

  type = number

  default = 20

}


variable "db_name" {

  description = "Database name"

  type = string

  default = "appdb"

}


variable "username" {

  description = "Database username"

  type = string

}


variable "password" {

  description = "Database password"

  type = string

  sensitive = true

}
