#VPC
resource "aws_vpc" "main_vpc" {
  cidr_block       = var.mainvpc-cidr
  instance_tenancy = "default"

  tags = {
    Name = "main_vpc"
  }
}
#SUBNET
resource "aws_subnet" "main_privatesubnet1" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.main_privateSubnet1-cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "DEV-private-subnet1"
  }
}

resource "aws_subnet" "main_privatesubnet2" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.main_privateSubnet2-cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "DEV-private-subnet2"
  }
}

resource "aws_subnet" "main_publicsubnet1" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.main_publicSubnet1-cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "DEV-public-subnet1"
  }
}

resource "aws_subnet" "main_publicsubnet2" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.main_publicSubnet2-cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "DEV-public-subnet2"
  }
}

#INTERNET GATEWAY
resource "aws_internet_gateway" "main_internet_gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "DEV-internet-gateway"
  }
}
#INTERNET GATEWAY ROUTE TABLE
resource "aws_route_table" "main_internet_gw" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_internet_gw.id
  }
  tags = {
    Name = "DEV-Internetgtway-routetable"
  }
}
#ROUTE TABLE ATTACHMENT
resource "aws_route_table_association" "main_publicsubnet1" {
  subnet_id      = aws_subnet.main_publicsubnet1.id
  route_table_id = aws_route_table.main_internet_gw.id
}
resource "aws_route_table_association" "main_publicsubnet2" {
  subnet_id      = aws_subnet.main_publicsubnet2.id
  route_table_id = aws_route_table.main_internet_gw.id
}



