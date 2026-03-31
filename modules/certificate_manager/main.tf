resource "aws_acm_certificate" "ak_jenkins_acm" {
    domain_name = var.ak_jenkins_domain_name
    validation_method = "DNS"

    tags = {
      Environment = "development"
    }

    lifecycle {
      create_before_destroy = false
    }
}

resource "aws_route53_record" "ak_jenkins_validation" {
    for_each = {
       for dvo in aws_acm_certificate.ak_jenkins_acm : dvo.domain_name => {
        name = dvo.resource_record_name
        record = dvo.resource_record_value
        type = dvo.resource_record_type
       } 
    }
    zone_id = var.ak_jenkins_hosted_zone_id
    name = each.value.name
    type = each.value.type
    records = [each.value.record]
    ttl = 60
}