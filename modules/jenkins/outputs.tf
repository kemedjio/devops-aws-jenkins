output "ak_jenkins_ssh_con_string_ec2" {
    value =  format("%s%s", "ssh -i /home/kemedjiokenlefakanicet/.ssh/ak-jenkins-ec2-key ubuntu@", aws_instance.ak_jenkins_instance.public_ip)

  
}
output "ak_jenkins_ec2_inst_id" {
    value = aws_instance.ak_jenkins_instance.id
  
}
output "ak_jenkins_ec2_inst_ip" {
    value = aws_instance.ak_jenkins_instance.public_ip
  
}
