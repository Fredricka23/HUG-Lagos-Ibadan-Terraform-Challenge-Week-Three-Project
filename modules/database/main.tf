resource "aws_db_subnet_group" "main" {

  name = "${var.environment}-db-subnet-group"


  subnet_ids = var.subnet_ids


  tags = {

    Name = "${var.environment}-db-subnet-group"

  }

}



resource "aws_db_instance" "main" {

  identifier = "${var.environment}-mysql"


  engine = "mysql"


  engine_version = "8.0"


  instance_class = var.db_instance_class


  allocated_storage = var.allocated_storage


  db_name = var.db_name


  username = var.username


  password = var.password


  db_subnet_group_name = aws_db_subnet_group.main.name


  vpc_security_group_ids = [

    var.security_group_id

  ]


  publicly_accessible = false


  skip_final_snapshot = true


  multi_az = false


  storage_encrypted = true


  tags = {

    Name = "${var.environment}-database"

  }

}
