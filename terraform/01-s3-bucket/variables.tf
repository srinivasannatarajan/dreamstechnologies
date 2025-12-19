variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
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
