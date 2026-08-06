#!/usr/bin/env bash
set -Eeuo pipefail

services=("${@:-ssh cron}")
failed=0

for service in ${services[*]}; do
  if systemctl is-active --quiet "$service"; then
    printf 'PASS service=%s state=active\n' "$service"
  else
    printf 'FAIL service=%s state=%s\n' "$service" \
      "$(systemctl is-active "$service" 2>/dev/null || true)"
    failed=1
  fi
done

exit "$failed"
