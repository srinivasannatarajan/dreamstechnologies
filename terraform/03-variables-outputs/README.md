# Terraform Challenge 3: Variables and Outputs

## Description

Demonstrates proper use of Terraform variables and outputs with validation.

## Features

- Parameterized configuration using input variables
- Variable validation for instance type and region
- Multiple output formats (individual and structured)
- Best practices for variable documentation

## Usage

### Using Default Values

```bash
terraform init
terraform plan
terraform apply
```

### Using Custom Values (CLI)

```bash
terraform apply -var="instance_type=t2.small" -var="region=us-west-2"
```

### Using Variable File

Create `terraform.tfvars`:

```hcl
instance_type = "t3.micro"
region        = "eu-west-1"
```

Then run:

```bash
terraform apply
```

### Interactive Mode

```bash
terraform apply
# You'll be prompted to enter values if not provided
```

## Outputs

- `instance_type`: The instance type used
- `region`: The deployment region
- `instance_id`: Created instance ID
- `deployment_summary`: Complete deployment information

## Variables

- `instance_type`: EC2 instance type (validated against allowed list)
- `region`: AWS region (validated against AWS region pattern)

## Example Output

```
instance_type = "t2.micro"
region = "us-east-1"
instance_id = "i-0123456789abcdef0"
deployment_summary = {
  ami_id = "ami-0c55b159cbfafe1f0"
  instance_id = "i-0123456789abcdef0"
  instance_type = "t2.micro"
  region = "us-east-1"
}
```
