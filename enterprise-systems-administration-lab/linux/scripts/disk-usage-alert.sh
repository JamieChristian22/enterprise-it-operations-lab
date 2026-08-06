#!/usr/bin/env bash
set -Eeuo pipefail
threshold="${1:-80}"
[[ "$threshold" =~ ^[0-9]+$ ]] && (( threshold >= 1 && threshold <= 100 )) || {
  echo "Threshold must be an integer from 1 to 100." >&2
  exit 64
}

alerts=0
while read -r fs size used avail pct mount; do
  usage="${pct%\%}"
  if (( usage >= threshold )); then
    printf 'ALERT filesystem=%s mount=%s usage=%s%% available_kb=%s\n' \
      "$fs" "$mount" "$usage" "$avail"
    alerts=1
  fi
done < <(df -Pk -x tmpfs -x devtmpfs | tail -n +2)

exit "$alerts"
