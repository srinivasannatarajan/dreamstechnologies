# Terraform Challenge 3: Variables and Outputs

## Description

Demonstrates proper use of Terraform variables and outputs with validation.

## Features

- Parameterized configuration using input variables
- Variable validation for instance type and region

## Usage

### Variables

- `instance_type`: EC2 instance type (validated against allowed list)
- `region`: AWS region (validated against AWS region pattern)

### Using Default Values

```bash
terraform init
terraform plan
terraform apply
```

### Using Custom Values

```bash
terraform apply -var="instance_type=t3.small" -var="region=us-west-2"
```

---

## Outputs

- `instance_type`: The instance type used
- `region`: The deployment region
