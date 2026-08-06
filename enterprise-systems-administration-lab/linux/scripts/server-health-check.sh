#!/usr/bin/env bash
set -Eeuo pipefail

disk_warn="${DISK_WARN_PERCENT:-80}"
inode_warn="${INODE_WARN_PERCENT:-80}"
status=0

section() { printf '\n===== %s =====\n' "$1"; }
warn() { echo "WARNING: $*" >&2; status=1; }

section "Identity"
hostnamectl --static
date --iso-8601=seconds
uname -r

section "Uptime and load"
uptime

section "Memory"
free -h

section "Filesystem utilization"
df -P -x tmpfs -x devtmpfs | awk 'NR==1 || $5+0 >= 0'
while read -r fs blocks used avail pct mount; do
  usage="${pct%\%}"
  (( usage >= disk_warn )) && warn "$mount is ${usage}% full"
done < <(df -P -x tmpfs -x devtmpfs | tail -n +2)

section "Inode utilization"
df -Pi -x tmpfs -x devtmpfs
while read -r fs inodes used free pct mount; do
  usage="${pct%\%}"
  (( usage >= inode_warn )) && warn "$mount inode usage is ${usage}%"
done < <(df -Pi -x tmpfs -x devtmpfs | tail -n +2)

section "Failed systemd units"
failed_units="$(systemctl --failed --no-legend --plain 2>/dev/null || true)"
if [[ -n "$failed_units" ]]; then
  echo "$failed_units"
  warn "One or more systemd units are failed"
else
  echo "No failed units"
fi

section "Listening sockets"
ss -tulpn

section "Recent warnings"
journalctl -p warning --since "-1 hour" --no-pager | tail -n 50 || true

section "Backup freshness"
latest_backup="$(find /var/backups/northstar -maxdepth 1 -type f -name '*.tar.gz' -printf '%T@ %p\n' 2>/dev/null | sort -nr | head -1 | cut -d' ' -f2- || true)"
if [[ -z "$latest_backup" ]]; then
  warn "No backup archive found"
else
  echo "Latest backup: $latest_backup"
  if find "$latest_backup" -mmin +1440 -print -quit | grep -q .; then
    warn "Latest backup is older than 24 hours"
  fi
fi

exit "$status"
