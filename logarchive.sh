#!/bin/bash

# Check if directory argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR=$1

# Check if the directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory $LOG_DIR does not exist."
    exit 1
fi

# Create the destination directory for compressed logs (if it doesn't exist)
DEST_DIR="./archives"
mkdir -p "$DEST_DIR"

# Get current date and time in format YYYYMMDD_HHMMSS (safe format)
DATE_TIME=$(date +"%Y%m%d_%H%M%S")

# Set the name of the compressed file
ARCHIVE_NAME="logs_archive_${DATE_TIME}.tar.gz"

# Compress the log files into a tar.gz archive
tar -czf "$DEST_DIR/$ARCHIVE_NAME" -C "$LOG_DIR" . || { echo "Error: Failed to create archive."; exit 1; }

# Log the date and time of the archive creation
echo "Logs archived on $DATE_TIME" >> "$DEST_DIR/archive_log.txt"

# Inform the user
echo "Logs have been archived into $DEST_DIR/$ARCHIVE_NAME"
tar -czf "$DEST_DIR/$ARCHIVE_NAME" -C "$LOG_DIR" . || { echo "Error: Failed to create archive."; exit 1; }



