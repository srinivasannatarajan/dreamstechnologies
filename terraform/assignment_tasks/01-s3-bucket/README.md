# Terraform Challenge 1: S3 Bucket with Tags

## Description

Creates an AWS S3 bucket with versioning enabled and custom tags (Environment, Owner).

## Features

- S3 bucket with unique naming using random suffix
- Versioning enabled
- Environment and Owner tags
- Public access blocked for security

## Usage

```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the configuration
terraform apply

# View outputs
terraform output

# Cleanup
terraform destroy
```

## Outputs

- `bucket_name`: The name of the created S3 bucket
- `bucket_arn`: The ARN of the bucket
- `versioning_status`: Current versioning status

## Variables

- `aws_region`: AWS region (default: us-east-1)
- `environment`: Environment tag (default: development)
- `owner`: Owner tag (default: DevOps Team)
