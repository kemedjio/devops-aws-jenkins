resource "aws_security_group" "ak_ec2_sg_http_ssh" {
    name = var.ak_ec2_sg_name
    description = "enable port 22(SSH) and port 80(HTTP)"
    vpc_id = var.ak_jenkins_vpc_id
    
    # ssh port for remote-exec
    ingress  {
        description = "Allow remote ssh"
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }
    # enable http
    ingress {
        description = "Allow HTTP request"
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }
    # enable https
    ingress {
        description = "Allow HTTPS request"
        from_port = 443
        to_port = 443
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
    }
    # Outgoing request
    egress {
        description = "Allow all outgoing requests"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = var.ak_ec2_sg_name
    }
  
}
resource "aws_security_group" "ak_jenkins_ec2_port_8080" {
    name = var.ak_jenkins_ec2_sg_name
    vpc_id = var.ak_jenkins_vpc_id
    description = "Enable port 8080 for jenkins"

    # Enable port 8080
    ingress {
        description = "Allow port 8080 for jenkins dashboard"
        from_port = 8080
        to_port = 8080
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
    }
    tags = {
      Name = var.ak_jenkins_ec2_sg_name
    }
  
}