#!/usr/bin/env bash
set -Eeuo pipefail

log_file="${1:-/var/log/auth.log}"
threshold="${FAILED_LOGIN_THRESHOLD:-5}"

[[ -r "$log_file" ]] || { echo "Cannot read $log_file" >&2; exit 66; }

echo "Failed SSH attempts by source address:"
grep -E 'Failed password|Invalid user' "$log_file" |
awk '
{
  ip=""
  for (i=1; i<=NF; i++) {
    if ($i == "from" && (i+1) <= NF) { ip=$(i+1); break }
  }
  if (ip != "") count[ip]++
}
END {
  for (ip in count) print count[ip], ip
}' | sort -nr | awk -v t="$threshold" '{
  severity=($1>=t) ? "ALERT" : "INFO"
  printf "%s attempts=%s source=%s\n", severity, $1, $2
}'
