#!/usr/bin/env bash
set -euo pipefail

# ----------------------------------------------------
# linux_ops_automation.sh
# Audit mode by default. Optional fix mode with --fix.
# ----------------------------------------------------

usage() {
	cat << 'EOF'
Usage:
	./scripts/linux_ops_automation.sh [--fix]

Modes:
	(default) Audit mode: generates a report without changing the system.
	--fix	  Fix mode: attempts safe corrective actions (requires sudo).

Examples:
	./scripts/linux_ops_automation.sh
	./scripts/linux_ops_automation.sh --fix
EOF
}
# ----------------------------------------------------------------------------
# ---- Arguments -----
fix_mode="false"

if [ "$#" -eq 0 ]; then
	fix_mode="false"
elif [ "$#" -eq 1 ] && [ "$1" = "--fix" ]; then
	fix_mode="true"
else
	usage
	exit 1
fi

# ---- Pathways (always relative to project root) ----
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

reports_dir="${PROJECT_ROOT}/reports"
mkdir -p "$reports_dir"

timestamp="$(date +%F_%H-%M-%S)"
report_file="${reports_dir}/linux_ops_report_${timestamp}.txt"
# ------------------------------------------------------------
# ---- Helpers ----
section() {
	echo
	echo "==== $1 ===="
}

write_header() {
	mode_label="AUDIT ONLY"
	if [ "$fix_mode" = "true" ]; then
		mode_label="AUDIT + FIX"
	fi

	{
		echo "Linux Operations Report:"
		echo "Generated: $(date)"
		echo "Mode: $mode_label"
		echo "Hostname: $(hostname)"
		echo "User: $(whoami)"
	} > "$report_file"
}

require_sudo_if_fix_mode() {
	if [ "$fix_mode" = "true" ]; then
		if ! command -v sudo >/dev/null 2>&1; then
			echo "ERROR: sudo not available, cannot run in --fix mode."
			exit 1
		fi
		# This checks whether sudo is available at that moment (may prompt for password):
		if ! sudo -n true >/dev/null 2>&1; then
			echo "NOTE: --fix mode requires sudo. You may be prompted for your password."
			sudo true
		fi
	fi
}
# ----------------------------------------------------------------------------------------------------
# ---- Audit Functions ----
audit_disk() {
	section "Disk Usage: "
	df -h
}

audit_memory() {
	section "Memory Usage: "
	# free may not exist on minimal installs, so to not crash the whole report:
	if command -v free >/dev/null 2>&1; then
		free -h
	else
		echo "free: command not available."
	fi
}

audit_top_cpu() {
	section "Top CPU Processes (Top 10): "
	ps aux --sort=-%cpu | head -n 11
}

audit_failed_services() {
	section "Failed Services: "
	if command -v systemctl >/dev/null 2>&1; then
		systemctl --failed || true
	else
		echo "systemctl not available on this system."
	fi
}

audit_recent_errors() {
	section "Recent System Errors (Last 20): "
	if command -v journalctl >/dev/null 2>&1; then
		if journalctl -p err -n 20 >/dev/null 2>&1; then
			journalctl -p err -n 20
		else
			echo "journalctl exists but access is restricted (requires elevated privileges or group access)."
		fi
	else
		echo "journalctl not available on this system."
	fi
}
# ---------------------------------------------
# ---- Main ----
require_sudo_if_fix_mode
write_header

{
	section "Uptime: "
	uptime

	audit_disk
	audit_memory
	audit_top_cpu
	audit_failed_services
	audit_recent_errors
} >> "$report_file"
# ---------------------------------------------

echo "Report created: $report_file"
