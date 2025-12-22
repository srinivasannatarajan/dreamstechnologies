# Terraform config to create a remote Instance

## Description

Deploys an EC2 instance as a setup to run the ansible playbooks.

## Features

- Amazon Linux 2 AMI (latest version)
- Security group with HTTP (80) and SSH (22) access
- Public IP output for easy access

## Usage

### Variables

- `aws_region`: AWS region (default: us-east-1)
- `instance_type`: EC2 instance type (default: t2.micro)

```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the configuration
terraform apply

# Cleanup
terraform destroy
```

### Outputs

- `public_ip`: Public IP address of the EC2 instance
- `instance_id`: EC2 instance ID
