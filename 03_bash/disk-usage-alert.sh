#!/bin/bash

#######################################
# Disk Usage Alert Script
# Checks disk usage and alerts if above 80%
# Usage: ./disk-usage-alert.sh
#######################################

THRESHOLD=80
ALERT_TRIGGERED=false

echo "========================================="
echo "Disk Usage Monitoring"
echo "Threshold: ${THRESHOLD}%"
echo "Date: $(date '+%Y-%m-%d %H:%M:%S')"
echo "========================================="
echo ""

# Get disk usage information (excluding tmpfs, devtmpfs, etc.)
df -h | grep -vE '^Filesystem|tmpfs|cdrom|loop' | awk '{print $1 " " $5 " " $6}' | while read -r line; do
    # Extract device, usage percentage, and mount point
    DEVICE=$(echo "$line" | awk '{print $1}')
    USAGE=$(echo "$line" | awk '{print $2}' | sed 's/%//g')
    MOUNTPOINT=$(echo "$line" | awk '{print $3}')
    
    # Check if usage is numeric
    if ! [[ "$USAGE" =~ ^[0-9]+$ ]]; then
        continue
    fi
    
    # Display partition info
    printf "%-30s %-10s %-20s" "$DEVICE" "${USAGE}%" "$MOUNTPOINT"
    
    # Check if usage exceeds threshold
    if [ "$USAGE" -ge "$THRESHOLD" ]; then
        echo "  ALERT - High Usage!!!"
        ALERT_TRIGGERED=true
    else
        echo "  OK"
    fi
done

echo ""
echo "========================================="

# Summary
echo "Summary:"
echo "--------"

# Count total partitions checked
PARTITION_COUNT=$(df -h | grep -vE '^Filesystem|tmpfs|cdrom|loop' | wc -l)
echo "Total partitions checked: $PARTITION_COUNT"

# Show detailed disk usage
echo ""
echo "Detailed Disk Usage:"
df -h | grep -vE 'tmpfs|cdrom|loop'

echo ""
echo "========================================="

# Final alert message
if [ "$ALERT_TRIGGERED" = true ]; then
    echo "  ALERT: One or more partitions exceed ${THRESHOLD}% usage!"
    echo "Action required: Clean up disk space or expand storage."
    exit 1
else
    echo " All partitions are within acceptable limits."
    exit 0
fi
