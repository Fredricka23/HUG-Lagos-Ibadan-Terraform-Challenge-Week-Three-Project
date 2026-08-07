resource "aws_internet_gateway" "main" {

  vpc_id = var.vpc_id

  tags = {
    Name = "${var.environment}-igw"
  }
}

resource "aws_subnet" "public_1" {

  vpc_id = var.vpc_id

  cidr_block = var.public_subnet_1_cidr

  availability_zone = var.az_1

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-public-subnet-1"
  }
}


resource "aws_subnet" "public_2" {

  vpc_id = var.vpc_id

  cidr_block = var.public_subnet_2_cidr

  availability_zone = var.az_2

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-public-subnet-2"
  }
}

resource "aws_subnet" "private_1" {

  vpc_id = var.vpc_id

  cidr_block = var.private_subnet_1_cidr

  availability_zone = var.az_1

  tags = {
    Name = "${var.environment}-private-subnet-1"
  }
}


resource "aws_subnet" "private_2" {

  vpc_id = var.vpc_id

  cidr_block = var.private_subnet_2_cidr

  availability_zone = var.az_2

  tags = {
    Name = "${var.environment}-private-subnet-2"
  }
}

resource "aws_eip" "nat" {

  domain = "vpc"

  tags = {
    Name = "${var.environment}-nat-eip"
  }
}

resource "aws_nat_gateway" "main" {

  allocation_id = aws_eip.nat.id

  subnet_id = aws_subnet.public_1.id


  tags = {
    Name = "${var.environment}-nat-gateway"
  }


  depends_on = [
    aws_internet_gateway.main
  ]
}

resource "aws_route_table" "public" {

  vpc_id = var.vpc_id


  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.main.id
  }


  tags = {
    Name = "${var.environment}-public-route-table"
  }
}

resource "aws_route_table_association" "public_1" {

  subnet_id = aws_subnet.public_1.id

  route_table_id = aws_route_table.public.id
}



resource "aws_route_table_association" "public_2" {

  subnet_id = aws_subnet.public_2.id

  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {

  vpc_id = var.vpc_id


  route {

    cidr_block = "0.0.0.0/0"

    nat_gateway_id = aws_nat_gateway.main.id
  }


  tags = {
    Name = "${var.environment}-private-route-table"
  }
}


resource "aws_route_table_association" "private_1" {

  subnet_id = aws_subnet.private_1.id

  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {

  subnet_id = aws_subnet.private_2.id

  route_table_id = aws_route_table.private.id
}
