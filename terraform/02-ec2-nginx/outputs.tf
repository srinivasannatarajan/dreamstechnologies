output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.nginx_server.public_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.nginx_server.id
}

output "nginx_url" {
  description = "URL to access Nginx web server"
  value       = "http://${aws_instance.nginx_server.public_ip}"
}
