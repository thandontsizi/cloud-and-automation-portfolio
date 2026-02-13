# Verification: Process and Services Inspection.
This document verifies that the processes and services tasks were completed using standard Linux commands.

## 1. Process Verification:
- Command: ps aux | head
- What I was verifying: Running processes can be listed and inspected.
- What I observed: A list of running processes with user, process ID (PID), CPU, and memoey usage.
- Why it matters: It shows how the system manages and displays running programs.


- Command: top
- What I was verifying: Real-time process activity and resource usage.
- What I observed: Processes updated live with changing memory and CPU usage.
- Why it matters: Helps identify perforamnce issues and resource-heavy processes.

## 2. Service Status Verification:
- Command: systemctl status ssh
- What I was verifying: Whether a service is running and is managed by systemd.
- What I observed: The service was active and was running under systemd control.
- Why it matters: Shows how Linux services are monitored and controlled.

## 3. Starting and Stopping a Service:
- Commands: start - sudo systemctl start ssh, stop - sudo systemctl stop ssh 
- What I was verifying: That services can be manually started and stopped.
- What I observed: The service status changed accordingly after each command.
- Why it matters: Demonstrates control over service lifecycle management.

## 4. Service Logs Verification:
- Command: journalctl -u ssh --no-pager | tail
- What I was verifying: That service logs can be viewed for troubleshooting.
- What I observed: Recent log entries related to the SSH service.
- Why it matters: Logs help identify errors and understand service behaviour.

## 5. Service Enablement at Boot Verification:
- Command: systemctl is-enabled ssh
- What I was verifying: Whether the service starts automatically on boot.
- What I observed: The service was enabled to start at boot.
- Why it matters: Ensures critical services remain available after reboots.

## 6. Failure and Recovery Verification:
- Command: sudo systemctl restart ssh
- What I was verifying: That services can recover through restarts.
- What I observed: The service started automatically without errors.
- Why it matters: Shows how Linux handles service recovery and stability.

## Completion Confirmation:
All commands executed successfully without modifying system-critical services.

This project confirms my ability to:
- Inspect running processes.
- Monitor system resource usage.
- Examine and reason about system-managed services.
