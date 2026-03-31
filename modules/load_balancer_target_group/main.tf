resource "aws_lb_target_group" "ak_jenkins_target_group" {
    name = var.ak_alb_target_group_name
    port = var.ak_alb_target_group_port
    protocol = var.ak_alb_target_group_protocol
    vpc_id = var.ak_jenkins_vpc_id
    health_check {
      path = "/login"
      port = 8080
      healthy_threshold = 6
      unhealthy_threshold = 2
      timeout = 2
      interval = 5
      matcher = "200"
    }
  
}
resource "aws_lb_target_group_attachment" "ak_jenkins_target_group_attach" {
    target_group_arn = aws_lb_target_group.ak_jenkins_target_group.arn
    target_id = var.ak_jenkins_ec2_inst_id
    port = 8080
  
}