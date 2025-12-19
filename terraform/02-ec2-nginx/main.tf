# Terraform Challenge 2: Deploy EC2 Instance with Nginx

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

# Data source to get the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Create a security group for the EC2 instance
resource "aws_security_group" "nginx_sg" {
  name        = "nginx-web-server-sg"
  description = "Security group for Nginx web server"

  # Allow HTTP traffic
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow SSH traffic
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx-security-group"
  }
}

# Create EC2 instance with Nginx installation
resource "aws_instance" "nginx_server" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.nginx_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              # Update system packages
              yum update -y
              
              # Install Nginx
              amazon-linux-extras install nginx1 -y
              
              # Create a custom index page
              cat > /usr/share/nginx/html/index.html <<'HTML'
              <!DOCTYPE html>
              <html>
              <head>
                  <title>Dreams Technologies - DevOps Assignment</title>
                  <style>
                      body {
                          font-family: Arial, sans-serif;
                          display: flex;
                          justify-content: center;
                          align-items: center;
                          height: 100vh;
                          margin: 0;
                          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                      }
                      .container {
                          text-align: center;
                          color: white;
                          background: rgba(0,0,0,0.3);
                          padding: 50px;
                          border-radius: 15px;
                      }
                      h1 { font-size: 3em; margin: 0; }
                      p { font-size: 1.2em; }
                  </style>
              </head>
              <body>
                  <div class="container">
                      <h1>🚀 Nginx is Running!</h1>
                      <p>Dreams Technologies DevOps Assignment</p>
                      <p>Deployed via Terraform with User Data</p>
                  </div>
              </body>
              </html>
              HTML
              
              # Start and enable Nginx
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name        = "nginx-web-server"
    Environment = "development"
    Purpose     = "DevOps Assignment"
  }
}
