# Terraform Challenge 2: EC2 Instance with Nginx

## Description

Deploys an EC2 instance with Nginx automatically installed via user data script.

## Features

- Amazon Linux 2 AMI (latest version)
- Automatic Nginx installation via user data
- Security group with HTTP (80) and SSH (22) access
- Custom HTML page served by Nginx
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
- `nginx_url`: Full URL to access the Nginx server

### Testing

After deployment, visit the `nginx_url` output in your browser to see the custom Nginx page.
