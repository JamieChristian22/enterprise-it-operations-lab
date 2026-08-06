#!/usr/bin/env bash
set -Eeuo pipefail
umask 077

backup_root="/var/backups/northstar"
retention_days="${RETENTION_DAYS:-14}"
timestamp="$(date -u +%Y%m%dT%H%M%SZ)"
hostname_short="$(hostname -s)"
archive="$backup_root/${hostname_short}-${timestamp}.tar.gz"
log_file="/var/log/northstar-backup.log"

sources=(/etc /srv/company-share /opt/northstar-api)
existing=()
for src in "${sources[@]}"; do
  [[ -e "$src" ]] && existing+=("${src#/}")
done

(( ${#existing[@]} > 0 )) || { echo "No backup sources exist." >&2; exit 66; }
install -d -m 0700 "$backup_root"

{
  echo "$(date --iso-8601=seconds) backup_started archive=$archive"
  tar --one-file-system --numeric-owner -C / -czf "$archive" "${existing[@]}"
  sha256sum "$archive" > "$archive.sha256"
  tar -tzf "$archive" >/dev/null
  find "$backup_root" -maxdepth 1 -type f \( -name '*.tar.gz' -o -name '*.sha256' \) \
    -mtime "+$retention_days" -delete
  echo "$(date --iso-8601=seconds) backup_completed bytes=$(stat -c %s "$archive")"
} | tee -a "$log_file"
