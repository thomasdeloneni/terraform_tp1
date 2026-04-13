output "instance_public_ip" {
  description = "IP publique de l'instance EC2 web"
  value       = aws_instance.web.public_ip
}

output "instance_url" {
  description = "URL HTTP de l'instance EC2 web"
  value       = "http://${aws_instance.web.public_ip}"
}
