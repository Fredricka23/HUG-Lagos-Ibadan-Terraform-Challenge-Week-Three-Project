output "database_endpoint" {

  description = "Database endpoint"

  value = aws_db_instance.main.endpoint

}


output "database_name" {

  value = aws_db_instance.main.db_name

}
