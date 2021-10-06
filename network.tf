


resource "aws_vpc" "vpc" {
  cidr_block       = var.networking.cidr_block
  instance_tenancy = "default"

  enable_dns_hostnames = true

  tags = var.tags
}


resource "aws_subnet" "subnets" {
  depends_on = [
    aws_vpc.vpc
  ]

  for_each  =  var.subnets 

  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.value.cidr_block

  availability_zone_id = each.value.availability_zone_id
  map_public_ip_on_launch = each.value.public


  tags = var.tags  
}

# internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  depends_on = [
    aws_vpc.vpc,
  ]

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "internet-gateway"
  }
}

# route table with target as internet gateway
resource "aws_route_table" "IG_route_table" {
  depends_on = [
    aws_vpc.vpc,
    aws_internet_gateway.internet_gateway,
  ]

  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "IG-route-table"
  }
}

resource "aws_route_table_association" "associate_routetable_to_public_subnet" {
  depends_on = [
    aws_subnet.subnets,
    aws_route_table.IG_route_table,
  ]

  for_each  =  var.subnets 

  subnet_id      = lookup(  aws_subnet.subnets , each.key ).id  
  route_table_id = aws_route_table.IG_route_table.id
}