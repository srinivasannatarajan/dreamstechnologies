variable "instance_type" {
  description = "EC2 instance type to deploy"
  type        = string
  default     = "t3.micro"

  validation {
    condition     = contains(["t2.micro", "t2.small", "t2.medium", "t3.micro", "t3.small"], var.instance_type)
    error_message = "Instance type must be one of: t2.micro, t2.small, t2.medium, t3.micro, t3.small."
  }
}

variable "region" {
  description = "AWS region for resource deployment"
  type        = string
  default     = "ap-south-2"

  validation {
    condition     = can(regex("^(us|eu|ap|sa|ca|me|af)-(north|south|east|west|central|northeast|southeast)-[1-9]$", var.region))
    error_message = "Region must be a valid AWS region identifier."
  }
}
