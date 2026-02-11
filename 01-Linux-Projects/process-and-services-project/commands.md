# Commands Used: Process and Services Inspection.
This file documents the Linux commands used to inspect running processes, monitor system resources, and examine system services. 
Each command includes a brief explanation and a real-world usage context.

## 1. Viewing Running Processes:
- Command: ps
- Explanation: Displays processes running in the current terminal session.
- Usage: Used to confirm that commands or scripts started from the shell are running.

## 2. Viewing All Processes on the System:
- Commmand: ps aux
- Explanation: Displays all running processes on the system, including background processes and services.
- Usage: Used when diagnosing system-wide issues such as high CPU or memory usage.

## 3. Real-Time Process Monitoring:
- Command: top
- Explanation: Displays a real-time continuously updating list of running processes sorted by resource usage.
- Usage: Used to identify processes consuming excessive CPU or memory.
- Exit: Press q to quit.

## 4. Enhanced Process Viewer:
- Command: htop
- Explanation: Provides an interactive and more readable alternative to top.
- Usage: Preferred for easier navigation and process management.

## 5. Identifying the Current User:
- Command: whoami
- Explanation: Displays the username of current logged-in user.
- Usage: Used to confirm process ownership and determine if elevated priviledges are required.

## 7. Searching for a Specific Process:
- Command: ps aux | grep ssh
- Explanation: Filters the list of running processes to show entries related to SSH.
- Usage: Used to confirm a specific service or application is running.

## 8. Listing Active System Services:
- Command: systemctl list-units --type=service
- Explanation: List all active services managed by systemd.
- Usage: Used to inspect which background services are currently running.

## 9. Checking the Status of a Service:
- Command: systemctl status ssh
- Explanation: Displays the current state, recent logs, and metadata of the SSH service.
- Usage: Used to verify whether a service is running, stopped, or has failed.

## 10. Checking if a Service Starts at Boot:
- Command: systemctl is-enabled ssh
- Explanation: Checks whether the specified service is enabled to start automatically at boot.
- Usage: Used to ensure critical services persist across system restarts.

## 11. Viewing System Uptime and Load:
- Command: uptime
- Explanation: Displays how long the system has been running and the average system load.
- Usage: Used to assess system stability and performance trends.

## 12. Viewing Memory Usage:
- Command: free -h
- Explanation: Displays memory and swap usage in a human-readable format.
- Usage: Used to diagnose memory-related performance issues.
