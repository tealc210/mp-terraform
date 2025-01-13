variable "ebs_az" {
  type = string
  default = "eu-west-3"
  description = "Availability zone to deploy EBS volume"
}

variable "ebs_size" {
  type = number
  default = 5
  description = "Size of the EBS volume in GB"
}

variable "instance_to_join" {
  type = string
  description = "ID of the instance to join"
}