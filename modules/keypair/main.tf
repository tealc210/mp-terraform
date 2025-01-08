resource "null_resource" "ssh_key" {
  provisioner "local-exec" {
    command = "ssh-keygen -t rsa -b 4096 -f ${var.keyfile_path}/${var.keyfile_name} -N ${var.key_passphrase}"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = var.keyfile_name
  public_key = file("${var.keyfile_path}/${var.keyfile_name}.pub")

  depends_on = [ null_resource.ssh_key ]
}