variable "ak_jenkins_ami_id" {
    description = "the ami id of the jenkins ec2 inst"
    type = string
  
}
variable "ak_jenkins_inst_type" {
    description = "the type of the jenkins ec2 instance"
    type = string
  
}
variable "ak_jenkins_tag_name" {
    description = "the name of the tag"
    type = string
  
}
variable "ak_jenkins_public_key" {
    description = "the public key of the ec2"
    type = string
  
}
variable "ak_jenkins_subnet_id" {
    description = "the subnet id of the jenkins ec2 instance"
    type = string
  
}
variable "ak_jenkins_sg" {
    description = "the security group of the jenkins ec2"
    type = list(string)
  
}
variable "ak_jenkins_enable_pub_ip" {
    description = "enable ec2 public ip on launch"
    type = bool
  
}
variable "ak_jenkins_user_data_install_jenkins" {
    description = "the user data to install jenkins on the ec2"
    type = string

  
}