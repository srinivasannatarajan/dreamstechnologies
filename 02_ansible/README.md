# Ansible Configuration Challenges

This directory contains a terraform config to deploy a remote VM in AWS and three Ansible playbooks demonstrating configuration management and automation tasks.

## Setup

### 1. Create the remote VM using terraform

```bash

# change your directory
cd ec2-remote-vm/

# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the configuration
terraform apply
```

---

### 2. Configure Inventory

Edit `inventory.ini` to add your target hosts:

```ini
[webservers]
nginx-server ansible_host=<IP from terraform output> ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/aws-key.pem

[all:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
```

## Playbooks

### 1. install-nginx.yml

**Purpose**: Install and start Nginx on a remote host.

**Usage**:

```bash
# Run the playbook
ansible-playbook -i inventory.ini install-nginx.yml
```

---

### 2. file-copy-permission.yml

**Purpose**: Copy a file to /opt/scripts and set permissions to 0755.

**Usage**:

```bash
# Run the playbook
ansible-playbook -i inventory.ini file-copy-permission.yml
```

**Source File**: `deploy-script.sh`  
**Destination**: `/opt/scripts/deploy-script.sh`

---

### 3. system-update.yml

**Purpose**: Update all system packages and reboot only if kernel was updated.

**Usage**:

```bash
# Run the playbook
ansible-playbook -i inventory.ini system-update.yml
```

---

## Testing

After Ansble playbook executions, visit the `nginx_url` output in your browser to see the custom Nginx page.
