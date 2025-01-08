variable "keyfile_path" {
  type        = string
  default     = "/tmp"
  description = "Path to SSH key file"
}

variable "keyfile_name" {
  type        = string
  default     = "ec2-defaultkey"
  description = "SSH key file name"
}

variable "key_passphrase" {
  type        = string
  default     = ""
  description = "Passphrase to use with the SSH key"
}