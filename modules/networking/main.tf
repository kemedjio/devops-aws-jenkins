# setup vpc for jenkins
resource "aws_vpc" "ak_jenkin_vpc" {
    cidr_block = var.ak_vpc_cidr
    tags = {
        Name = var.ak_vpc_name
    }
  
}

# Setup two public subnet
resource "aws_subnet" "ak_jenkins_public_sub" {
    count = length(var.ak_cidr_public_subnet)
    vpc_id = aws_vpc.ak_jenkin_vpc.id
    cidr_block = element(var.ak_cidr_public_subnet, count.index)
    availability_zone = element(var.ak_avalability_zone, count.index)

    tags = {
      Name = "dev-jenkin-subnet-${count.index + 1}"
    }
  
}

# Setup two privates subnet
resource "aws_subnet" "ak_jenkins_private_sub" {
    count = length(var.ak_cidr_private_subnet)
    vpc_id = aws_vpc.ak_jenkin_vpc.id
    cidr_block = element(var.ak_cidr_private_subnet, count.index)
    availability_zone = element(var.ak_avalability_zone, count.index)

    tags = {
      Name = "dev-jenkins-subnet-${count.index + 1}"
    }
  
}

# Setup internet gateway
resource "aws_internet_gateway" "ak_jenkins_igw" {
    vpc_id = aws_vpc.ak_jenkin_vpc.id
    tags = {
      Name = "dev-jenkins-igw"
    }
  
}
# Setup public route table
resource "aws_route_table" "ak_jenkins_public_rt" {
    vpc_id = aws_vpc.ak_jenkin_vpc.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ak_jenkins_igw.id

    }
    tags = {
            Name = "dev-jenkins-public-rt"
        }
  
}
# public route table and public subnet association
resource "aws_route_table_association" "ak_jenkin_pub_rt_assoc" {
    count = length(aws_subnet.ak_jenkins_public_sub)
    subnet_id = aws_subnet.ak_jenkins_public_sub[count.index].id
    route_table_id = aws_route_table.ak_jenkins_public_rt.id
  
}
# Setup private route table
resource "aws_route_table" "ak_jenkins_private_rt" {
    vpc_id = aws_vpc.ak_jenkin_vpc.id
    # depends_on = [aws_nat_gateway.ak_nat_gateway]
    tags = {
      Name = "dev-jenkins-private-rt"
    }
  
}
# private route table and private subnet association
resource "aws_route_table_association" "ak_jenkin_priv_rt_assoc" {
    count = length(aws_subnet.ak_jenkins_private_sub)
    subnet_id = aws_subnet.ak_jenkins_private_sub[count.index].id
    route_table_id = aws_route_table.ak_jenkins_private_rt.id
  
}