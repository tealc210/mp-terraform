resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {

  key_name   = var.keyfile_name
  public_key = tls_private_key.rsa_key.public_key_openssh

}
