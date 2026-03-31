variable "ak_alb_target_group_name" {
    description = "The target group for jenkins alb"
    type = string
  
}
variable "ak_alb_target_group_port" {
    description = "The port for jenkins"
    type = number
  
}
variable "ak_alb_target_group_protocol" {
    description = "The protocol for jenkins target group"
    type = string
  
}
variable "ak_jenkins_vpc_id" {
    description = "The vpc id for jenkins"
    type = string
  
}
variable "ak_jenkins_ec2_inst_id" {
    description = "the id of jenkins ec2"
    type = string
  
}