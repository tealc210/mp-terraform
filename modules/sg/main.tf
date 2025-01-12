data aws_vpc "aws_training_vpc" {
    filter {
      name = "tag:Name"
      values = ["${var.vpc_name}"]
    }
}

resource "aws_security_group" "sg_web" {
  name        = "SG_WEB"
  description = "Allow WEB inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.aws_training_vpc.id

  tags = {
    Name = "SG_WEB"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.sg_web.id
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.sg_web.id
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls" {
  security_group_id = aws_security_group.sg_web.id
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_8080" {
  security_group_id = aws_security_group.sg_web.id
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow_all" {
  security_group_id = aws_security_group.sg_web.id
  ip_protocol = -1
  cidr_ipv4         = "0.0.0.0/0"
}
