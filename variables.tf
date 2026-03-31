variable "ak_jenkins_cidr_private_subnet" {
    description = "private Subnet CIDR"
    type = list(string)
  
}
variable "ak_jenkins_availability_zone" {
    description = "Availability zones"
    type = list(string)
  
}
variable "ak_jenkins_public_key" {
    description = "the jenkins ec2 public key"
    type = string
  
}
variable "ak_jenkins_ec2_ami_id" {
    description = "the ec2 ami"
    type = string
  
}
variable "ak_jenkins_vpc_cidr" {
    description = "the vpc cidr"
    type = string
  
}
variable "ak_jenkins_vpc_name" {
    description = "the name of the vpc"
    type = string
  
}
variable "ak_jenkins_cidr_public_subnet" {
    description = "the cidr of the public subnet"
    type = list(string)
  
}
variable "ak_ec2_sg_name" {
    description = "the name of the ec2  sg"
    type = string
  
}
variable "ak_jenkins_ec2_sg_name" {
    description = "the name of the jenkins sg"
    type = string
  
}
variable "ak_jenkins_inst_type" {
    description = "the type of the jenkins ec2"
    type = string
  
}
variable "ak_jenkins_tag_name" {
    description = "the tag name of the jenkins ec2"
    type = string
  
}
variable "ak_alb_target_group_name" {
    description = "the target group name of jenkins ec2"
    type = string
  
}
variable "ak_alb_target_group_port" {
    description = "the port of the alb"
    type = number
  
}

variable "ak_alb_target_group_protocol" {
    description = "the target group protocol for jenkins ec2"
    type = string
  
}
variable "ak_jenkins_lb_name" {
    description = "the name of the jenkins load balancer"
    type = string
  
}


variable "ak_jenkins_lb_type" {
    description = "The type of the jenkins lb"
    type = string
  
}
variable "ak_jenkins_lb_is_external" {
    description = "The type of lb"
    type = bool
    default = false
}
variable "ak_jenkins_lb_tag_name" {
    description = "the tag for lb resource"
    type = string
}  
variable "ak_jenkins_lb_listner_port" {
    description = "the listening port of lb"
    type = number
  
}
variable "ak_jenkins_lb_listner_protocol" {
    description = "the listening protocol"
    type = string
  
}
variable "ak_jenkins_lb_listner_default_action" {
    description = "the default action of the lb listener"
    type = string
  
}
variable "ak_jenkins_lb_https_listner_port" {
    description = "the lb listening port for https"
    type = number
  
}

variable "ak_jenkins_lb_https_listner_protocol" {
    description = "the listening protocol for https"
    type = string
  
}
variable "ak_jenkins_lb_target_group_attach_port" {
    description = "the attachment port for the target group"
    type = number
  
}
variable "ak_jenkins_enable_pub_ip" {
    description = "enable ec2 public ip on launch"
    type = bool
  
}
variable "ak_jenkins_domain_name" {
    description = "the domaine name"
    type = string
  
}