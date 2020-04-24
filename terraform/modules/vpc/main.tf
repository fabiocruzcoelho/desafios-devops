resource "aws_vpc" "desafio_idwall" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "desafio_idwall_pub_subnet" {
  vpc_id                  = aws_vpc.desafio_idwall.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = "true"

  tags = {
    Name = "${var.subnet_name}"
  }
}

resource "aws_internet_gateway" "desafio_idwall_igw" {
  vpc_id = aws_vpc.desafio_idwall.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_default_route_table" "default_rt" {
  default_route_table_id = aws_vpc.desafio_idwall.default_route_table_id

  route {
    cidr_block = var.cidr_igw
    gateway_id = aws_internet_gateway.desafio_idwall_igw.id
  }

  tags = {
    Name = var.rt_name
  }
}

resource "aws_route_table_association" "desafio_idwall_rta" {
  subnet_id      = aws_subnet.desafio_idwall_pub_subnet.id
  route_table_id = aws_default_route_table.default_rt.id
}
