#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------
# user_provision.sh
# Safely creates a user if it doesn't exist.
# Optional: Add user to sudo group.
# ------------------------------------------

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

logs_dir="${PROJECT_ROOT}/logs"
mkdir -p "$logs_dir"
log_file="${logs_dir}/user_provision.log"

log() {
	# Usage: log "message"
	echo "[INFO] $(date '+%F %T') - $1" | tee -a "$log_file"
}

warn() {
	echo "[WARN] $(date '+%F %T') - $1" | tee -a "$log_file" >&2
}

die() {
	echo "[ERROR] $(date '+%F %T') - $1" | tee -a "$log_file" >&2
	exit 1
}

usage() {
	cat << 'EOF'
usage:
	./scripts/user_provision.sh <username> [--sudo]

Description:
	Creates a Linux user if it does not already exist.
	Optionally adds the user to the sudo group.

Examples:
	./scripts/user_provision.sh thando
	./scripts/user_provision.sh thando --sudo
EOF
}

# ---- argument validation ----
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
	usage
	exit 1
fi

username="$1"
make_sudo="false"

if [ "$#" -eq 2 ]; then
	if [ "$2" = "--sudo" ]; then
		make_sudo="true"
	else
		usage
		exit 1
	fi
fi

# ---- basic input sanity ----
# Simple username check: Starts with a letter, then letters/numbers/_/-
if ! [[ "$username" =~ ^[a-zA-Z][a-zA-Z0-9_-]*$ ]]; then
	die "Invalid username: '$username'"
fi

log "Starting user provisioning for: $username (sudo: $make_sudo)"

# ---- check dependencies ----
if ! command -v id >/dev/null 2>&1; then
	die "Required command not found: id"
fi

if ! command -v sudo >/dev/null 2>&1; then
	die "sudo not found. Installsudo or run from an environment with sudo available."
fi

# ---- check if user exists ----
if id "$username" &>/dev/null; then
	log "User already exists: $username"
else
	log "User does not exist. Creating: $username"

	# Prefer adduser on Debian/Ubuntu. Fallback to useradd if needed.
	if command -v adduser >/dev/null 2>&1; then
		sudo adduser "$username"
	elif command -v useradd >/dev/null 2>&1; then
		sudo useradd -m -s /bin/bash "$username"
		warn "Used useradd (fallback). You may need to set a password: sudo passwd $username"
	else
		die "Neither adduser nor useradd is available. Cannot create user."
	fi

	log "User created successfully: $username"
fi

# ---- optional sudo group ----
if [ "$make_sudo" = "true" ]; then
	if getent group sudo >/dev/null 2>&1; then
		log "Adding user '$username' to sudo group."
		sudo usermod -aG sudo "$username"
		log "User '$username' added to sudo group."
	else
		die "Group 'sudo' does not exist on this system."
	fi
fi

log "Provisioning complete for: $username"
echo "Done. Log: $log_file"
