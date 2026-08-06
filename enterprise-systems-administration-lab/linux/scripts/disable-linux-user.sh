#!/usr/bin/env bash
set -Eeuo pipefail

[[ $EUID -eq 0 ]] || { echo "Run as root." >&2; exit 77; }
[[ $# -eq 1 ]] || { echo "Usage: sudo $0 <username>" >&2; exit 64; }

username="$1"
id "$username" >/dev/null 2>&1 || { echo "Unknown user: $username" >&2; exit 65; }
[[ "$(id -u "$username")" -ge 1000 ]] || { echo "Refusing to disable system account." >&2; exit 66; }

archive_dir="/var/backups/northstar/offboarded-users"
timestamp="$(date -u +%Y%m%dT%H%M%SZ)"
home_dir="$(getent passwd "$username" | cut -d: -f6)"

install -d -m 0700 "$archive_dir"
passwd --lock "$username"
usermod --expiredate 1 --shell /usr/sbin/nologin "$username"
loginctl terminate-user "$username" 2>/dev/null || true

if [[ -d "$home_dir" ]]; then
  tar --one-file-system -czf "$archive_dir/${username}-${timestamp}.tar.gz" "$home_dir"
  sha256sum "$archive_dir/${username}-${timestamp}.tar.gz" \
    > "$archive_dir/${username}-${timestamp}.tar.gz.sha256"
fi

echo "Disabled account: $username"
passwd -S "$username"
chage -l "$username" | sed -n '1,4p'
