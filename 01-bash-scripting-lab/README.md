# Bash Scripting Lab:

## Overview:
This lab simulates automation tasks performed on a Linux server environment.

It focuses on writing production-style Bash scripts that:
- Fail safely.
- Validate inputs.
- Generate structured output.
- Handle real system data.
- Follow defensive scripting practices.
---------------------------------------

## Environment Assumptions:
This lab assumes:
- Ubuntu or Debian-based system.
- Bash shell.
- Standard system utilities available (hostname, uptime, df, free, systemctl, etc.).
- Appropriate priviledges for user managements tasks.
-----------------------------------------------------

## Scripts in This Lab:

### 1. system_health_report.sh:
Generates a timestamped report containing:
- Hostname.
- Current user. 
- System uptime.
- Disk usage.
- Memory usage.
- Top CPU-consuming processes.
- Failed services (if any).

The script:
- Uses strict mode.
- Creates structured output.
- Fails safely if commands fail.
--------------------------------

### user_provision.sh:
Automated safe user creation by:
- Validating argument input.
- Checking if a user exists.
- Checking the user if necessary.
- Adding user to a specific group.
- Exiting cleanly on failure.

The script:
- Uses strict mode.
- Implements argument validation.
- Avoids silent failures.
-------------------------

## Objectives:
By completing this lab, I demonstrate:
- Practical Bash scripting ability.
- Defensive scripting techniques.
- Server-aware automation design.
- Operational thinking.
-----------------------

## Directory Structure:
<pre>
 01-bash-scripting-lab
  ├── README.md
  └── scripts
        ├── system-health-report.sh
        └── user-provision.sh
</pre>
-----------------------------------

## Notes:
This lab is designed to reflect real infrastructure tasks rather than academic exercises.
