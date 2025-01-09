variable "ebs_size" {
    type = number
    default = 5
    description = ""
}

variable "host_tags" {
    type = map(string)
    default = {}
    description = "Tags applied to EC2 instance"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
  description = "AWS instance type"
}