resource "null_resource" "ssh_key" {
  provisioner "local-exec" {
    command = "[ -f ${var.keyfile_path}/${var.keyfile_name} ] || ssh-keygen -t rsa -b 4096 -f ${var.keyfile_path}/${var.keyfile_name} -N '${var.key_passphrase}'"
  }
}

data "local_file" "ssh_key" {
  filename = "${var.keyfile_path}/${var.keyfile_name}.pub"
  depends_on = [ null_resource.ssh_key ]
}

resource "aws_key_pair" "deployer" {
  
  key_name   = var.keyfile_name
  public_key = data.local_file.ssh_key.content
}
