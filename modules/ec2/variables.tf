variable "ebs_size" {
    type = number
    default = 5
    description = "Size of the Elastic Block Storage in GB"
}

variable "host_tags" {
    type = map(string)
    default = {}
    description = "Tags applied to EC2 instance"
}

variable "key_name" {
  type = string
  description = "Key name of the Key Pair to use for the instance"
}

variable "srv_key" {
  type = string
  description = "Private key"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
  description = "AWS instance type"
}
