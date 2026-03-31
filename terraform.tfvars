ak_jenkins_cidr_private_subnet = [ "12.0.3.0/24", "12.0.4.0/24" ]
ak_jenkins_ec2_ami_id = "ami-0694d931cee176e7d"
ak_jenkins_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCg5fUtFvRcnlTapH5EUP1zqvDbRcTqnzqjAS9L2PT5YJ55MMFtBqniQVOgbUHMHYULZtQCATFfvLaxsOnivEBuImo2hJ0LaiVcHyN6QcyTyyNgqSqVH9p7tKxiQ5q3sCvTmA89oc1G1z11XxRXXpRda1JceopwFqMppDUhGmSEmZbYJNd5We8O+vct3uYeAOw42DLR5TMU9YgjJMVYnRDptloiYRwjOn8iREpmo8P00rUxmlUVKXiuYNP6RuBDt5IVI0RUZLPWLKtu76AKYLsdvAxl8AxHtOG3klFW5j3496TqzDw5lUBPRdQlEQMx1WWk0bP+MglNOr6RjqObVplRyMH4/W42WxFEh2xAk1urObAggv4Wg0N+giJbbgtYi4UIaVOevTyHGvvYqvYDNsO+eXoYex/gK3RnffrqR1+mRIrsOw8IlPLJJ2lmeeZiVTJK6TfypHWxd1jpVN19D2vb/6FSZlyRxuqaChJxrqj3u5OpKNH5d6asjqg6zY93UqKFNfD9u4Xp0FM2SaAjIYPJ61FqabknZXj+i4f7/62kd3AgbRmjjjUGf5slEDjiDOE2yU4A7wbKM5Flkvl4NloD1O6G3HXlEE+3WDFljjUYHKvcCjNWSRg7jWzyVUoc4Jq5HjXKiX9q4an1AYm+DhohMmuX0W3V9Tac8pE5ytE+CQ== kemedjiokenlefakanicet@penguin"
ak_jenkins_cidr_public_subnet = [ "12.0.1.0/24", "12.0.2.0/24" ]
ak_jenkins_vpc_cidr = "12.0.0.0/16"
ak_jenkins_vpc_name = "ak-jenkins-vpc"
ak_jenkins_availability_zone = [ "us-east-1a", "us-east-1b" ]
ak_ec2_sg_name = "SG for EC2 to enable HTTP(80), SSH(22), HTTPS(443) "
ak_jenkins_ec2_sg_name = "Allow port 8080 for jenkins instance"
ak_jenkins_inst_type = "t2.meduim"
ak_jenkins_tag_name = "Jenkins:Ubuntu Linux EC2"
ak_alb_target_group_name = "jenkins-lb-target-group"
ak_alb_target_group_protocol = "HTTP"
ak_alb_target_group_port = 8080
ak_jenkins_lb_name = "ak-jenkins-alb"
ak_jenkins_lb_is_external = false
ak_jenkins_lb_type = "application"
ak_jenkins_lb_tag_name = "ak-jenkins-alb"
ak_jenkins_lb_listner_port = 80
ak_jenkins_lb_listner_protocol = "HTTP"
ak_jenkins_lb_listner_default_action = "forward"
ak_jenkins_lb_https_listner_port = 443
ak_jenkins_lb_https_listner_protocol = "HTTPS"
ak_jenkins_lb_target_group_attach_port = 8080
ak_jenkins_enable_pub_ip = true
ak_jenkins_domain_name = "example.com"

