output "ec2_security_group_id" {

  description = "EC2 security group ID"

  value = aws_security_group.ec2.id

}


output "database_security_group_id" {

  description = "Database security group ID"

  value = aws_security_group.database.id

}
