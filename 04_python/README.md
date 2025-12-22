# Python DevOps Challenges

This directory contains three Python scripts demonstrating automation and AWS integration tasks.

## Installation

### Required Python Packages

```bash
# Install pip
sudo apt install python3-pip

# Install boto3 for AWS EC2 task
pip install boto3

# For API Health Checker
pip install requests

# Install all requirements
pip install -r requirements.txt
```

### requirements.txt

```
requests>=2.31.0
boto3>=1.28.0
```

## Scripts

### 1. json-parser.py

**Purpose**: Reads a JSON file containing server details and filters production environment servers.

**Usage**:

```bash
python3 json-parser.py sample-servers.json
```

**Sample Output**:

```
PRODUCTION SERVERS
Total servers: 10
Production servers: 6

Server #1
  Name: web-prod-01
  IP Address: 10.0.1.10
  Environment: production
  OS: Ubuntu 22.04
  ...
```

---

### 2. api-health-checker.py

**Purpose**: Monitors API endpoint health by sending HTTP GET requests.

**Usage**:

```bash
python3 api-health-checker.py https://api.github.com
```

**Example Tests**:

```bash
# Test healthy endpoint
python3 api-health-checker.py https://api.github.com

# Test custom endpoint
python3 api-health-checker.py https://httpbin.org/status/200

# Test down endpoint (simulated)
python3 api-health-checker.py https://httpbin.org/status/500
```

---

### 3. ec2-list.py

**Purpose**: Lists all running EC2 instances using boto3 AWS SDK.

**AWS Configuration**:

```bash
# set environment variables
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="us-east-1"
```

**Usage**:

```bash
# List instances in default region (us-east-1)
python3 ec2-list.py

# List instances in specific region
python3 ec2-list.py us-west-2
```

**Sample Output**:

```
AWS EC2 RUNNING INSTANCES - Region: us-east-1
Total Running Instances: 3

Instance #1
  Instance ID:   i-0123456789abcdef0
  Name:          web-server-01
  Type:          t3.micro
  Public IP:     54.123.45.67
  ...
```
