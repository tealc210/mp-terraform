
output "eip_public_ip" {
  value = aws_eip.lb.public_ip
}

output "eip_public_dns" {
  value = aws_eip.lb.public_dns
}
