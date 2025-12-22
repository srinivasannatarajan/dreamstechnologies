#!/bin/bash

#######################################
# Sample Deployment Script
# This script is used by the Ansible file-copy-permission playbook
# Purpose: Demonstrates file copy and permission setting
#######################################

echo "========================================="
echo "Dreams Technologies - Deployment Script"
echo "========================================="
echo "Date: $(date)"
echo "Host: $(hostname)"
echo "User: $(whoami)"
echo ""

# Sample deployment tasks
echo "Running deployment tasks..."
echo "  Checking application files"
echo "  Verifying dependencies"
echo "  Running health checks"
echo "  Deployment completed successfully"

echo ""
echo "========================================="
echo "This script was deployed via Ansible"
echo "Permissions: 0755 (executable)"
echo "Location: /opt/scripts/deploy-script.sh"
echo "========================================="

exit 0
