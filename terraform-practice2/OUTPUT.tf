

output "public_ip_address" {
  value = aws_instance.linux_server.public_ip  
}

output "private_ip_address" {
  value = aws_instance.linux_server.private_ip
}

output "public_dns" {
  value = aws_instance.linux_server.public_dns
  
}