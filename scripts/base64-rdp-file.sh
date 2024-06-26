#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <IP> <username> <password>"
    exit 1
fi

# Get the input parameters
IP=$1
USERNAME=$2
PASSWORD=$3

# Create the RDP file content
RDP_CONTENT="[Desktop]
screen mode id:i:2
desktopwidth:i:1920
desktopheight:i:1080
session bpp:i:32
auto connect:i:1
full address:s:$IP
username:s:$USERNAME
password 51:b:${PASSWORD}
prompt for credentials on client:i:1
administrative session:i:1"

# Save the RDP file
RDP_FILE="remote.rdp"
echo "$RDP_CONTENT" > $RDP_FILE

# Convert the RDP file to base64
BASE64_RDP=$(base64 "$RDP_FILE")

# Output the base64 data
export rdp_base64="$BASE64_RDP"

# Clean up the RDP file
rm "$RDP_FILE"
