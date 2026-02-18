# Linux Operations Automation Project:

## Overview:
This project integrates the skills from the previous three Linux lab projects into a single operational workflow.

It provides a production-style Bash script that can:
- Audit system health (safe, read-only).
- Generate a structured report.
- Optionally apply corrective actions when run with '--fix'.
------------------------------------------------------------

## What It Checks (Audit Mode):
The script audits:
- Host information (hostname, current user, uptime).
- Disk usage.
- Memory usage.
- Running processes (top CPU consumers).
- Failed services (if systemctl is available).
- Recent system errors (journalctl if available).
-------------------------------------------------

## Fix Mode:
When run with '--fix' the script may attempt safe corrective actions such as:
- Restarting failed services (where appropriate).
- Creating missing report/log directories.
- Applying basic corrective steps that are low-risk.

Fix mode requires sudo priviledges.
-----------------------------------

## Usage:
Audit only (no system changes):
- ./scripts/;linux_ops_automation.sh

Audit + Attempt Fixes:
- ./scripts/;inux_ops_automation.sh --fix
-----------------------------------------

## Output:
- A timestamped report saved in reports/.
- A summary is printed to the terminal after execution.
-------------------------------------------------------

## Directory Structure:
04-linux-operations-automation-project
 ├── README.md
 └── scripts
       └── linux_ops_automation.sh
