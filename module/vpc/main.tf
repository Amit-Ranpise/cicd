#vpc creation
resource "aws_vpc" "my_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"


  tags = {
    Name = "my_vpc"
  }
}
#Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "igw"
  }
}

#subnets
resource "aws_subnet" "subnets" {
  vpc_id     = aws_vpc.my_vpc.id
  availability_zone = "${element(var.azs,count.index)}"
  count = length(var.subnets)
  cidr_block = "${element(var.subnets,count.index)}"

  tags = {
    Name = "${element(var.subnets_name,count.index)}"
  }
}
#route table
resource "aws_route_table" "rt_vpc" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0" #public
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "rt_vpc"
  }
}

#subnet Association
resource "aws_route_table_association" "art" {
  count = length(var.subnets)
  subnet_id      = aws_subnet.subnets[count.index].id 
  route_table_id = aws_route_table.rt_vpc.id
}