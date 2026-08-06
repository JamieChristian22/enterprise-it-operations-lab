#!/usr/bin/env bash
set -Eeuo pipefail
backup_dir="${1:-/var/backups/northstar}"
max_age_hours="${2:-24}"
[[ -d "$backup_dir" ]] || { echo "Backup directory not found." >&2; exit 66; }
latest="$(find "$backup_dir" -type f -printf '%T@ %p\n' | sort -nr | head -1 | cut -d' ' -f2-)"
[[ -n "$latest" ]] || { echo "No backup files found." >&2; exit 1; }
age_hours=$(( ($(date +%s)-$(stat -c %Y "$latest"))/3600 ))
echo "latest_backup=$latest"
echo "age_hours=$age_hours"
(( age_hours <= max_age_hours ))
