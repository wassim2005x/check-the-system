#!/bin/bash

# Update the system
echo "Updating the system..."
sudo apt update && sudo apt upgrade -y
echo "System update completed."

# Check system files integrity
echo "Checking system files integrity..."
sudo debsums -c
echo "System files integrity check completed."

# Network security
echo "Checking network security..."
sudo ufw status
echo "Network firewall status checked."

# Disk health check
echo "Checking disk health..."
sudo smartctl --all /dev/sda
echo "Disk health check completed."

# Clean up unnecessary files
echo "Cleaning up unnecessary files..."
sudo apt autoremove -y
sudo apt clean
echo "Unnecessary files cleaned."

# Scan for viruses and malware
echo "Starting virus and malware scan..."
sudo clamscan -r / | tee ~/clamscan_report.txt
echo "Virus and malware scan completed. Report saved to ~/clamscan_report.txt."

# Check filesystem integrity
echo "Checking filesystem integrity..."
for fs in $(lsblk -f | grep ext4 | awk '{print $1}'); do
  sudo fsck /dev/$fs
done
echo "Filesystem integrity check completed."

echo "Script execution completed."

