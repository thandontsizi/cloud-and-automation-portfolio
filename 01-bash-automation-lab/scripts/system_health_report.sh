#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# -------------------------------------------
# system_health_report.sh
# Generates timestamped system health report.
# -------------------------------------------

# Usage: This script expects zero arguments.
if [ "$#" -ne 0 ]; then
	echo "Usage: ./system_health_report.sh"
	exit 1
fi

# Creates reports directory if it does not exist.
reports_dir="${PROJECT_ROOT}/reports"
mkdir -p "$reports_dir"

timestamp="$(date +%F_%H-%M-%S)"
report_file="${reports_dir}/system_report_${timestamp}.txt"

# Helper function for consistent section headings.
section() {
	echo
	echo "=== $1 ==="
}

# Write report header.
{
	echo "System Health Report:"
	echo "Generated: $(date)"
	echo "Hostname: $(hostname)"
	echo "User: $(whoami)"
} > "$report_file"

# Append Sections:
{
	section "Uptime: "
	uptime

	section "Disk Usage: "
	df -h

	section "Memory Usage: "
	free -h || true

	section "Top CPU Processes (Top 10): "
	ps aux --sort=-%cpu | head -n 11

	section "Failed Services: "
	if command -v systemctl >/dev/null 2>&1; then
		systemctl --failed || true
	else
		echo "systemctl not available on this system."
	fi

	section "Recent System Errors (Last 20): "
	if command -v journalctl >/dev/null 2>&1; then
		journalctl -p err -n 20 || true
	else
		echo "journalctl not available on this system."
	fi
} >> "$report_file"

echo "Report Created: $report_file"
