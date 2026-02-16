# System Audit Commands:
This file lists the exact commands used during the system audit.
Each command is recorded with its purpose to ensure the audit is repeatable and explainable.

## 1. System Information:
### Check Kernel and OS Information:
- uname -a: Shows kernel version, architecture, and system details.
- lsb_release -a: Displays Linux distribution name and version.

## 2. User and Identity Checks:
### Identify Current User:
- whoami: Confirms which user account is performing the audit.
- who: Shows who is currently logged into the system.

## 3. Disk and Filesystem Usage:
### View Disk Usage:
- df -h: Displays filesystem usage in a human-readable format.
### Check Directory Sizes:
- du -sh /: Provides a summary of disk usage starting from root.

## 4. Processes and Services:
### View Running Processes:
- ps aux: Lists all running processes with ownership and resource usage.
### Check System Services:
- systemctl list-units --type=service: Shows active services managed by systemd.

## 5. Networking:
### Display IP Configuration:
- ip a: Shows network interfaces and assigned IP addresses.
### Test Network Connectivity:
- ping -c 4 google.com: Checks basic network connectivity.

## 6. Package Management:
### Update Package Lists:
- sudo apt update: Refreshes available package information.
### List Upgradable Packages:
- apt list --upgradable: Shows packages that can be updated
