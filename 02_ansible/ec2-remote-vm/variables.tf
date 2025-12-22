variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "ap-south-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair created in AWS Console"
  type        = string
  default     = "EC2-VMs"  # Replace with your actual key name from AWS Console
}
