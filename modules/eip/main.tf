resource "aws_eip" "lb" {
  instance = var.instance_id
  domain   = "vpc"

  provisioner "local-exec" {
    command = "echo '${self.public_ip} | ${self.public_dns}' > jenkins_ec2.txt"
  }
}