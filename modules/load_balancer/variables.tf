variable "ak_jenkins_lb_name" {
    description = "The name of the jenkins alb"
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
variable "ak_jenkins_sg_enabled_ssh_https_id" {
    description = "security group for ssh and hhtps"
    type = string
}
variable "ak_jenkins_subnet_ids" {
    description = "the subnet for the lb"
    type = list(string)
  
}
variable "ak_jenkins_tag_name" {
    description = "the tag for lb resource"
    type = string
  
}
variable "ak_jenkins_target_group_arn" {
    description = "the arn of the lb target group"
    type = string
  
}
variable "ak_jenkins_ec2_inst_id" {
    description = "the id of the jenkkins ec2 instance"
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
  
}
variable "ak_jenkins_acm_arn" {
    description = "the aws certificate manager for the lb"
    type = string
}
variable "ak_jenkins_lb_target_group_attach_port" {
    description = "the attachment port for the target group"
    type = number
  
}