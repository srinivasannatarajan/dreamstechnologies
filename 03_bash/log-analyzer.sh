#!/bin/bash

#######################################
# Log File Analyzer
# Counts ERROR lines and shows last error timestamp
# Usage: ./log-analyzer.sh <logfile>
#######################################

# Check if log file argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <logfile>"
    echo "Example: $0 /var/log/application.log"
    exit 1
fi

LOGFILE="$1"

# Check if file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found!"
    exit 1
fi

# Count ERROR lines
ERROR_COUNT=$(grep -c "ERROR" "$LOGFILE")

echo "========================================="
echo "Log File Analysis Report"
echo "========================================="
echo "File: $LOGFILE"
echo "Total ERROR entries: $ERROR_COUNT"
echo ""

# Find last error with timestamp
if [ $ERROR_COUNT -gt 0 ]; then
    echo "Last ERROR entry:"
    echo "-----------------------------------------"
    # Extract last line containing ERROR
    LAST_ERROR=$(grep "ERROR" "$LOGFILE" | tail -n 1)
    echo "$LAST_ERROR"
    echo "-----------------------------------------"
    
    # Try to extract timestamp (assuming common log formats)
    # Handles formats like: 2025-12-18 10:30:45 or [2025-12-18 10:30:45]
    TIMESTAMP=$(echo "$LAST_ERROR" | grep -oE '\[?[0-9]{4}-[0-9]{2}-[0-9]{2}[T ]?[0-9]{2}:[0-9]{2}:[0-9]{2}\]?' | head -n 1)
    
    if [ -n "$TIMESTAMP" ]; then
        echo "Last ERROR timestamp: $TIMESTAMP"
    else
        echo "Timestamp: Could not extract timestamp (check log format)"
    fi
else
    echo "No ERROR entries found in the log file."
fi

echo "========================================="
