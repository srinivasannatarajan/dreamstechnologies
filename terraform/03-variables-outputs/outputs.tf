output "instance_type" {
  description = "The instance type used for deployment"
  value       = var.instance_type
}

output "region" {
  description = "The AWS region where resources are deployed"
  value       = var.region
}

output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.example.id
}

output "deployment_summary" {
  description = "Summary of the deployment configuration"
  value = {
    instance_type = var.instance_type
    region        = var.region
    instance_id   = aws_instance.example.id
    ami_id        = aws_instance.example.ami
  }
}
