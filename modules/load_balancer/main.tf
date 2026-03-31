resource "aws_lb" "ak_jenkins_lb" {
    name = var.ak_jenkins_lb_name
    internal = var.ak_jenkins_lb_is_external
    load_balancer_type = var.ak_jenkins_lb_type
    security_groups = [var.ak_jenkins_sg_enabled_ssh_https_id]
    subnets = var.ak_jenkins_subnet_ids

    enable_deletion_protection = false

    tags = {
      Name = "ak_jenkins_lb"
    }
  
}
resource "aws_lb_target_group_attachment" "ak_jenkins_lb_tg_attach" {
    target_group_arn = var.ak_jenkins_target_group_arn
    target_id = var.ak_jenkins_ec2_inst_id
    port = var.ak_jenkins_lb_target_group_attach_port
  
}

resource "aws_lb_listener" "ak_jenkins_lb_listner_http" {
    load_balancer_arn = aws_lb.ak_jenkins_lb.arn
    port = var.ak_jenkins_lb_listner_port
    protocol = var.ak_jenkins_lb_listner_protocol
    default_action {
      type = var.ak_jenkins_lb_listner_default_action
      target_group_arn = var.ak_jenkins_target_group_arn
    }
  
}
# https listner
resource "aws_lb_listener" "ak_jenkins_lb_listner_https" {
    load_balancer_arn = aws_lb.ak_jenkins_lb.arn
    port = var.ak_jenkins_lb_https_listner_port
    protocol = var.ak_jenkins_lb_https_listner_protocol
    ssl_policy = "ELBSecurityPolicy-FS-1-2-Res-2019-08"
    certificate_arn = var.ak_jenkins_acm_arn
    default_action {
      type = var.ak_jenkins_lb_listner_default_action
      target_group_arn = var.ak_jenkins_target_group_arn
    }
  
}