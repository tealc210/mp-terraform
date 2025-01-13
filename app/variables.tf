variable "key_name" {
  type        = string
  description = "Name of the SSH key to use and deploy on instance"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC to use"
}

variable "instance_type" {
  type        = string
  description = "AWS instance type"
}