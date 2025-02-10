data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "training_host" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name
  root_block_device {
    delete_on_termination = true
  }
  security_groups = [ "SG_WEB" ]
  tags          = var.host_tags

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update && sudo apt-get install -y wget",
      "wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/containerd.io_1.7.24-1_amd64.deb",
      "wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce_27.4.1-1~ubuntu.22.04~jammy_amd64.deb",
      "wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce-cli_27.4.1-1~ubuntu.22.04~jammy_amd64.deb",
      "wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-compose-plugin_2.32.1-1~ubuntu.22.04~jammy_amd64.deb",
      "sudo dpkg -i containerd.io_1.7.24-1_amd64.deb docker-ce_27.4.1-1~ubuntu.22.04~jammy_amd64.deb docker-ce-cli_27.4.1-1~ubuntu.22.04~jammy_amd64.deb docker-compose-plugin_2.32.1-1~ubuntu.22.04~jammy_amd64.deb",
      "wget https://raw.githubusercontent.com/eazytrainingfr/jenkins-training/refs/heads/master/docker-compose.yml",
      "sudo docker compose -f /home/ubuntu/docker-compose.yml up -d"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = var.srv_key
      host        = self.public_ip
    }
  }
}
