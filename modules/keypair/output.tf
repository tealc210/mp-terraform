output "local_prv_key_path" {
  value = "${var.keyfile_path}/${var.keyfile_name}.prv"
}

output "local_pub_key_path" {
  value = "${var.keyfile_path}/${var.keyfile_name}.pub"
}
