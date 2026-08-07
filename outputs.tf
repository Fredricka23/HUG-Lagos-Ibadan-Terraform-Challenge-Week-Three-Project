output "web_server_public_ip" {

  description = "Public IP of the web server"

  value = module.compute.public_ip

}


output "web_server_instance_id" {

  description = "EC2 Instance ID"

  value = module.compute.instance_id

}

output "database_endpoint" {

  description = "RDS database endpoint"

  value = module.database.database_endpoint

}
