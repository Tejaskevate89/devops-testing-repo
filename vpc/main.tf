provider "aws" {
  region = var.region
}

resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "myvpc"
  }
}

resource "aws_subnet" "pvtsubnet" {
  vpc_id                  = aws_vpc.myvpc.id
  availability_zone       = var.pvt_subnet_az
  cidr_block              = var.pvt_subnet_cidr
  map_public_ip_on_launch = false

  tags = {
    Name = "pvtsubnet"
  }
}

resource "aws_subnet" "pubsubnet" {
  vpc_id                  = aws_vpc.myvpc.id
  availability_zone       = var.pub_subnet_az
  cidr_block              = var.pub_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "pubsubnet"
  }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "myigw"
  }
}

resource "aws_route_table" "myrout" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

  tags = {
    Name = "myrout"
  }
}
