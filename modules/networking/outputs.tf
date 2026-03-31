
output "ak_jenkins_vpc_id" {
    value = aws_vpc.ak_jenkin_vpc.id
  
}
output "ak_jenkins_public_subnets" {
    value = aws_subnet.ak_jenkins_public_sub.*.id 
  
}
output "ak_jenkins_public_sub_cidr_block" {
    value = aws_subnet.ak_jenkins_public_sub.*.cidr_block
  
}