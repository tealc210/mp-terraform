resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {

  key_name   = var.keyfile_name
  public_key = tls_private_key.rsa_key.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
      echo '${tls_private_key.rsa_key.private_key_pem}' > ${var.keyfile_path}/${var.keyfile_name}.prv
      echo '${tls_private_key.rsa_key.public_key_openssh}' > ${var.keyfile_path}/${var.keyfile_name}.pub
      chmod 600 ${var.keyfile_path}/${var.keyfile_name}.prv
    EOT
  }

}
