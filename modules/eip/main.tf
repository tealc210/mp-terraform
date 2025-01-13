resource "aws_eip" "lb" {
  instance = var.instance_id
  domain   = "vpc"

  provisioner "local-exec" {
    command = "echo -e '${self.public_ip} | ${self.public_dns}\nPlease connect to your newly deployed Jenkins instance through this URL : http://${self.public_dns}:8080' > jenkins_ec2.txt"
  }
}