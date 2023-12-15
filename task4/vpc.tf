resource "aws_vpc" "dev"{
 tags = {
   Name = "my-vpc"
 }
 cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "Public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "Private-subnet"
  }
}

resource "aws_route_table" "public-rt" {
 vpc_id = aws_vpc.dev.id
 tags = {
   Name = "public-rt"
 }
}

resource "aws_route_table" "private-rt" {
 vpc_id = aws_vpc.dev.id
 tags = {
   Name = "private-rt"
 }
}

resource "aws_internet_gateway" "igw"{
 tags = {
   Name = "my-igw"
 }
 vpc_id = aws_vpc.dev.id
}

resource "aws_eip" "eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "ngw" {
 tags = {
   Name = "my-ngw"
 }
 subnet_id = aws_subnet.public.id
 allocation_id = aws_eip.eip.id
}

resource "aws_route" "route-to-igw"{
 route_table_id = aws_route_table.public-rt.id
 destination_cidr_block = "0.0.0.0/0"
 gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route" "route-to-ngw"{
 route_table_id = aws_route_table.private-rt.id
 destination_cidr_block = "0.0.0.0/0"
 gateway_id = aws_nat_gateway.ngw.id
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private-rt.id
}





