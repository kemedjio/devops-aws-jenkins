
output "ak_ec2_sg_http_ssh_id" {
    value = aws_security_group.ak_ec2_sg_http_ssh.id
  
}
output "ak_jenkins_ec2_port_8080_id" {
    value = aws_security_group.ak_jenkins_ec2_port_8080.id
  
}
