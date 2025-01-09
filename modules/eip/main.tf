resource "aws_eip" "lb" {
  instance = var.instance_id
  domain   = "vpc"
}