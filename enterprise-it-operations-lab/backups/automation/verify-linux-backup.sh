#!/usr/bin/env bash
set -Eeuo pipefail

backup_file="${1:?Usage: $0 backup_file checksum_file}"
checksum_file="${2:?Usage: $0 backup_file checksum_file}"

[[ -f "$backup_file" ]] || { echo "Backup file missing." >&2; exit 66; }
[[ -f "$checksum_file" ]] || { echo "Checksum file missing." >&2; exit 66; }

sha256sum -c "$checksum_file"
tar -tzf "$backup_file" >/dev/null

echo "PASS backup=$backup_file"
