data "aws_ami" "ubuntu" {

  most_recent = true

  owners = ["099720109477"]


  filter {

    name = "name"

    values = [
      "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
    ]

  }


  filter {

    name = "virtualization-type"

    values = [
      "hvm"
    ]

  }

}

module "vpc" {

  source = "./modules/vpc"


  vpc_cidr = var.vpc_cidr


  environment = var.environment

}


module "networking" {

  source = "./modules/networking"


  vpc_id = module.vpc.vpc_id


  environment = var.environment


  public_subnet_1_cidr = "10.0.1.0/24"

  public_subnet_2_cidr = "10.0.2.0/24"


  private_subnet_1_cidr = "10.0.10.0/24"

  private_subnet_2_cidr = "10.0.20.0/24"


  az_1 = "us-east-1a"

  az_2 = "us-east-1b"

}

module "security" {

  source = "./modules/security"


  vpc_id = module.vpc.vpc_id


  environment = var.environment


  my_ip = "41.182.104.155"

}

module "compute" {

  source = "./modules/compute"


  subnet_id = module.networking.public_subnet_1_id


  security_group_id = module.security.ec2_security_group_id


  environment = var.environment


  instance_type = "t2.micro"


  ami_id = data.aws_ami.ubuntu.id

}

module "database" {

  source = "./modules/database"


  environment = var.environment


  subnet_ids = [
    module.networking.private_subnet_1_id,
    module.networking.private_subnet_2_id
  ]


  security_group_id = module.security.database_security_group_id


  db_instance_class = "db.t3.micro"


  allocated_storage = 20


  db_name = "appdb"


  username = "admin"


  password = var.db_password

}
