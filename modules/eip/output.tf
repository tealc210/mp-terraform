
output "eip_public_ip" {
  value = aws_eip.public_ip
}

output "eip_public_dns" {
  value = aws_eip.public_dns
}
