#!/usr/bin/env bash
set -Eeuo pipefail
[[ $EUID -eq 0 ]] || { echo "Run as root." >&2; exit 77; }

backup_root="/var/backups/northstar"
archive="$(find "$backup_root" -maxdepth 1 -type f -name '*.tar.gz' -printf '%T@ %p\n' | sort -nr | head -1 | cut -d' ' -f2-)"
[[ -n "$archive" ]] || { echo "No backup archive found." >&2; exit 66; }
checksum_file="$archive.sha256"
[[ -f "$checksum_file" ]] || { echo "Checksum file missing." >&2; exit 67; }

sha256sum -c "$checksum_file"
tar -tzf "$archive" >/dev/null

restore_dir="$(mktemp -d /tmp/northstar-restore-test.XXXXXX)"
trap 'rm -rf "$restore_dir"' EXIT
tar -xzf "$archive" -C "$restore_dir"

[[ -d "$restore_dir/etc" ]] || { echo "Expected etc directory not restored." >&2; exit 68; }
echo "PASS archive=$archive restore_dir=$restore_dir"
