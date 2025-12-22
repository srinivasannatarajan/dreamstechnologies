#!/bin/bash

#######################################
# Backup Script for /var/www/html
# Creates compressed backup with date stamp
# Usage: ./backup-script.sh
#######################################

# Configuration
SOURCE_DIR="/var/www/html"
BACKUP_DIR="/mnt/g/Interview Preparations/dreamstechnologies/03_bash"
DATE=$(date +%Y-%m-%d)
BACKUP_FILE="www-backup-${DATE}.tar.gz"
BACKUP_PATH="${BACKUP_DIR}/${BACKUP_FILE}"

echo "========================================="
echo "Web Directory Backup Script"
echo "========================================="
echo "Date: $(date '+%Y-%m-%d %H:%M:%S')"
echo "Source: $SOURCE_DIR"
echo "Destination: $BACKUP_PATH"
echo ""

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Creating backup directory: $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create backup directory!"
        exit 1
    fi
fi

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Warning: Source directory '$SOURCE_DIR' not found!"
    echo "Creating sample directory for demonstration..."
    # For demo purposes, create a sample directory
    SOURCE_DIR="./sample_www"
    mkdir -p "$SOURCE_DIR"
    echo "<html><body><h1>Sample Web Page</h1></body></html>" > "$SOURCE_DIR/index.html"
    echo "Sample backup created in: $SOURCE_DIR"
fi

# Create compressed backup
echo "Creating backup..."
tar -czf "$BACKUP_PATH" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")" 2>/dev/null

# Check if backup was successful
if [ $? -eq 0 ]; then
    # Get backup file size
    BACKUP_SIZE=$(du -h "$BACKUP_PATH" | cut -f1)
    
    echo ""
    echo "  Backup completed successfully!"
    echo "  File: $BACKUP_FILE"
    echo "  Size: $BACKUP_SIZE"
    echo "  Path: $BACKUP_PATH"
    
    # List recent backups
    echo ""
    echo "Recent backups in $BACKUP_DIR:"
    ls -lh "$BACKUP_DIR"/*.tar.gz 2>/dev/null | tail -5
    
    # Clean up old backups (Recommeneded to cleanup backups to avoid storage saturation)
    echo ""
    echo "Cleaning up backups older than 7 days..."
    find "$BACKUP_DIR" -name "www-backup-*.tar.gz" -type f -mtime +7 -delete
    echo "Cleanup completed."
else
    echo "Error: Backup failed!"
    exit 1
fi

echo "========================================="
