output "instance_id" {
  value = aws_instance.training_host.id
}

output "instance_az" {
  value = aws_instance.training_host.availability_zone
}