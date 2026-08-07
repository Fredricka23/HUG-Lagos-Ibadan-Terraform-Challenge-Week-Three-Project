resource "aws_security_group" "ec2" {

  name = "${var.environment}-ec2-sg"

  description = "Security group for web server"

  vpc_id = var.vpc_id


  ingress {

    description = "HTTP access"

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }


  ingress {

    description = "SSH access from my IP"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["${var.my_ip}/32"]

  }


  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }


  tags = {

    Name = "${var.environment}-ec2-sg"

  }

}


resource "aws_security_group" "database" {

  name = "${var.environment}-database-sg"

  description = "Security group for database"

  vpc_id = var.vpc_id


  ingress {

    description = "Database access from EC2 only"

    from_port = 3306

    to_port = 3306

    protocol = "tcp"

    security_groups = [
      aws_security_group.ec2.id
    ]

  }


  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }


  tags = {

    Name = "${var.environment}-database-sg"

  }

}
