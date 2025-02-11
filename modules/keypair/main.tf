resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {
  key_name   = var.keyfile_name
  public_key = tls_private_key.rsa_key.public_key_openssh
}

resource "local_file" "private_key" {
  filename = "${var.keyfile_name}.pem"
  content  = tls_private_key.rsa_key.private_key_pem
  file_permission = "0600"
}
