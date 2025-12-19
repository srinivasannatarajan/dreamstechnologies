# Terraform Challenge 1: Create S3 Bucket with Tags

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Generate a unique bucket name using random string
resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

# Create S3 bucket with versioning and tags
resource "aws_s3_bucket" "main" {
  bucket = "dreams-tech-assignment-${random_string.bucket_suffix.result}"

  tags = {
    Environment = var.environment
    Owner       = var.owner
    Purpose     = "DevOps Interview Assignment"
  }
}

# Enable versioning on the S3 bucket
resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Block public access (security best practice)
resource "aws_s3_bucket_public_access_block" "main" {
  bucket = aws_s3_bucket.main.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
