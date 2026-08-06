#!/usr/bin/env bash
set -Eeuo pipefail

usage() {
  echo "Usage: sudo $0 <username> <full-name> <group> <public-key-file>" >&2
  exit 64
}

[[ $EUID -eq 0 ]] || { echo "Run as root." >&2; exit 77; }
[[ $# -eq 4 ]] || usage

username="$1"
full_name="$2"
group="$3"
key_file="$4"

[[ "$username" =~ ^[a-z_][a-z0-9_-]{2,31}$ ]] || {
  echo "Invalid username: $username" >&2
  exit 65
}
[[ -s "$key_file" ]] || { echo "Public key file not found or empty." >&2; exit 66; }

getent group "$group" >/dev/null || groupadd "$group"

if id "$username" >/dev/null 2>&1; then
  echo "Account already exists: $username" >&2
  exit 67
fi

useradd --create-home --shell /bin/bash --comment "$full_name" "$username"
usermod -aG "$group" "$username"
passwd --lock "$username" >/dev/null

home_dir="$(getent passwd "$username" | cut -d: -f6)"
install -d -m 0700 -o "$username" -g "$username" "$home_dir/.ssh"
install -m 0600 -o "$username" -g "$username" "$key_file" "$home_dir/.ssh/authorized_keys"

echo "Created account: $username"
id "$username"
stat -c '%U:%G %a %n' "$home_dir/.ssh" "$home_dir/.ssh/authorized_keys"
