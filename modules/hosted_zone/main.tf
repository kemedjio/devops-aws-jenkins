data "aws_route53_zone" "ak_jenkins_lb_zone" {
    name = "example.com"
    private_zone = false
  
}
resource "aws_route53_record" "ak_jenkins_lb_record" {
    zone_id = data.aws_route53_zone.ak_jenkins_lb_zone.zone_id
    name = var.ak_jenkins_domain_name
    type = "A"

    alias {
      name = var.ak_jenkins_aws_lb_dns_name
      zone_id = var.ak_jenkins_aws_lb_zone_id
      evaluate_target_health = true
    }
  
}
