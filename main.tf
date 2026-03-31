module "networking" {
    source = "./modules/networking"
    ak_vpc_cidr = var.ak_jenkins_vpc_cidr
    ak_vpc_name = var.ak_jenkins_vpc_name
    ak_cidr_public_subnet = var.ak_jenkins_cidr_public_subnet
    ak_avalability_zone = var.ak_jenkins_availability_zone
    ak_cidr_private_subnet = var.ak_jenkins_cidr_private_subnet

}
module "security_groups" {
    source = "./modules/security_groups"
    ak_ec2_sg_name = var.ak_ec2_sg_name
    ak_jenkins_ec2_sg_name = var.ak_jenkins_ec2_sg_name
    ak_jenkins_vpc_id = module.networking.ak_jenkins_vpc_id
  
}
module "jenkins" {
    source = "./modules/jenkins"
    ak_jenkins_ami_id = var.ak_jenkins_ec2_ami_id
    ak_jenkins_inst_type = var.ak_jenkins_inst_type
    ak_jenkins_tag_name = var.ak_jenkins_tag_name
    ak_jenkins_public_key = var.ak_jenkins_public_key
    ak_jenkins_subnet_id = tolist(module.networking.ak_jenkins_public_subnets)[0]
    ak_jenkins_sg = [module.security_groups.ak_ec2_sg_http_ssh_id,module.security_groups.ak_jenkins_ec2_port_8080_id]
    ak_jenkins_enable_pub_ip = var.ak_jenkins_enable_pub_ip
    ak_jenkins_user_data_install_jenkins = templatefile("./modules/jenkins-runner-script/jenkins-installer.sh", {})
}
module "lb_target_group" {
    source = "./modules/load_balancer_target_group"
    ak_alb_target_group_name = var.ak_alb_target_group_name
    ak_alb_target_group_port = var.ak_alb_target_group_port
    ak_alb_target_group_protocol = var.ak_alb_target_group_protocol
    ak_jenkins_ec2_inst_id = module.jenkins.ak_jenkins_ec2_inst_id
    ak_jenkins_vpc_id = module.networking.ak_jenkins_vpc_id
  
}
module "hosted_zone" {
    source = "./modules/hosted_zone"
    ak_jenkins_domain_name = var.ak_jenkins_domain_name
    ak_jenkins_aws_lb_dns_name = module.alb.ak_jenkins_aws_lb_dns_name
    ak_jenkins_aws_lb_zone_id = module.alb.ak_jenkins_aws_lb_zone_id
  
}
module "aws_certificate_manager" {
    source = "./modules/certificate_manager"
    ak_jenkins_domain_name = var.ak_jenkins_domain_name
    ak_jenkins_hosted_zone_id = module.hosted_zone.ak_jenkins_hosted_zone_id

  
}
module "alb" {
    source = "./modules/load_balancer"
    ak_jenkins_lb_name = var.ak_jenkins_lb_name
    ak_jenkins_lb_is_external = var.ak_jenkins_lb_is_external
    ak_jenkins_lb_type = var.ak_jenkins_lb_type
    ak_jenkins_sg_enabled_ssh_https_id = module.security_groups.ak_ec2_sg_http_ssh_id
    ak_jenkins_subnet_ids = tolist(module.networking.ak_jenkins_public_subnets)
    ak_jenkins_tag_name = var.ak_jenkins_lb_tag_name
    ak_jenkins_target_group_arn = module.lb_target_group.ak_jenkins_target_group_arn
    ak_jenkins_ec2_inst_id = module.jenkins.ak_jenkins_ec2_inst_id
    ak_jenkins_lb_listner_port = var.ak_alb_target_group_port
    ak_jenkins_lb_listner_protocol = var.ak_alb_target_group_protocol
    ak_jenkins_lb_listner_default_action = var.ak_jenkins_lb_listner_default_action
    ak_jenkins_lb_https_listner_port = var.ak_jenkins_lb_https_listner_port
    ak_jenkins_lb_https_listner_protocol = var.ak_jenkins_lb_https_listner_protocol
    ak_jenkins_acm_arn = module.aws_certificate_manager.ak_jenkins_acm_arn
    ak_jenkins_lb_target_group_attach_port = var.ak_jenkins_lb_target_group_attach_port
  
}