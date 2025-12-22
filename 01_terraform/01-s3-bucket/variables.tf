variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "ap-south-2"
}

variable "environment" {
  description = "Environment tag value"
  type        = string
  default     = "development"
}

variable "owner" {
  description = "Owner tag value"
  type        = string
  default     = "DevOps Team"
}
