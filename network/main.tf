resource "aws_vpc" "main" {
  cidr_block = var.vpc-cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    "Name" = "${var.pj}-${var.name}-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.pj}-${var.name}-igw"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet-cidr
  map_public_ip_on_launch = true

  tags = {
    "Name" = "${var.pj}-${var.name}-public"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name" = "${var.pj}-${var.name}-public"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route" "public_internet_access" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}