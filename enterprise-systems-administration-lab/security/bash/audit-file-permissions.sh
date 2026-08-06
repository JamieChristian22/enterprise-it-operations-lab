#!/usr/bin/env bash
set -Eeuo pipefail
output="${1:-output/file-permission-audit.txt}"
mkdir -p "$(dirname "$output")"
{
 echo "world_writable:"
 find / -xdev -type f -perm -0002 2>/dev/null | head -100
 echo "suid_sgid:"
 find / -xdev -type f \( -perm -4000 -o -perm -2000 \) 2>/dev/null | head -100
 echo "sensitive_files:"
 stat /etc/shadow /etc/sudoers /etc/ssh/sshd_config 2>/dev/null
} | tee "$output"
