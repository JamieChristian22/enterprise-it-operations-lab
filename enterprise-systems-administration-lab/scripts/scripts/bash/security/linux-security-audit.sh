#!/usr/bin/env bash
set -Eeuo pipefail
output="${1:-output/linux-security-audit.txt}"
mkdir -p "$(dirname "$output")"
{
 echo "generated=$(date --iso-8601=seconds)"
 echo "world_writable_files:"
 find / -xdev -type f -perm -0002 2>/dev/null | head -100
 echo "listening_ports:"
 ss -tulpn
 echo "failed_ssh_logins:"
 grep -E 'Failed password|Invalid user' /var/log/auth.log 2>/dev/null | tail -50 || true
} | tee "$output"
