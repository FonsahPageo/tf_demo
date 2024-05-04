# VPC
resource "aws_vpc" "fonsah-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.tenancy

  tags = {
    Name : var.vpc_tag
  }
}

# Internet Gateway
resource "aws_internet_gateway" "fonsah-ig" {
  vpc_id = aws_vpc.fonsah-vpc.id

  tags = {
    Name : var.ig_tag
  }
}

# Public Subnet
resource "aws_subnet" "fonsah-pub-sn" {
  vpc_id                  = aws_vpc.fonsah-vpc.id
  cidr_block              = var.pub_sn_cidr
  map_public_ip_on_launch = var.assign_ip

  tags = {
    Name : var.pub_sn_tag
  }
}

# Private Subnet
resource "aws_subnet" "fonsah-priv-sn" {
  vpc_id     = aws_vpc.fonsah-vpc.id
  cidr_block = var.priv_sn_cidr

  tags = {
    Name : var.priv_sn_tag
  }
}

# Public Route Table
resource "aws_route_table" "fonsah-pub-rt" {
  vpc_id = aws_vpc.fonsah-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.fonsah-ig.id
  }

  tags = {
    Name : var.pub_rt_tag
  }
}

# Private Route Table
resource "aws_route_table" "fonsah-priv-rt" {
  vpc_id = aws_vpc.fonsah-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.fonsah-nat-gw.id
  }


  tags = {
    Name : var.priv_rt_tag
  }
}

# Public route table association
resource "aws_route_table_association" "fonsah-pub-rt-association" {
  route_table_id = aws_route_table.fonsah-pub-rt.id
  subnet_id      = aws_subnet.fonsah-pub-sn.id
}

# Private route table association
resource "aws_route_table_association" "fonsah-priv-rt-association" {
  route_table_id = aws_route_table.fonsah-priv-rt.id
  subnet_id      = aws_subnet.fonsah-priv-sn.id
}

# Elastic IP
resource "aws_eip" "fonsah-eip" {
  tags = {
    Name : var.eip_tag
  }
}  

# NAT Gateway
resource "aws_nat_gateway" "fonsah-nat-gw" {
  allocation_id = aws_eip.fonsah-eip.id
  subnet_id     = aws_subnet.fonsah-pub-sn.id

  tags = {
    Name = var.nat_gw_tag
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.fonsah-ig]
}


