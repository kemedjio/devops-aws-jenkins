resource "aws_instance" "ak_jenkins_instance" {
    ami = var.ak_jenkins_ami_id
    instance_type = var.ak_jenkins_inst_type
    tags = {
        Name = var.ak_jenkins_tag_name
    }
    key_name = "ak-jenkins-ec2-key"
    subnet_id = var.ak_jenkins_subnet_id
    vpc_security_group_ids = var.ak_jenkins_sg
    associate_public_ip_address = var.ak_jenkins_enable_pub_ip
    user_data = var.ak_jenkins_user_data_install_jenkins

    metadata_options {
      http_endpoint = "enabled"
      http_tokens = "required"
    }
  
}
resource "aws_key_pair" "ak_jenkins_key_pair" {
    key_name = "ak-jenkins-ec2-key"
    public_key = var.ak_jenkins_public_key
  
}