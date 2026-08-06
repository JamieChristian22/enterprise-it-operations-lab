#!/usr/bin/env bash
set -Eeuo pipefail
output="${1:-output/linux-patch-report.txt}"
mkdir -p "$(dirname "$output")"
{
 echo "generated=$(date --iso-8601=seconds)"
 echo "hostname=$(hostname -f)"
 if command -v apt >/dev/null; then
   apt list --upgradable 2>/dev/null | tail -n +2
 elif command -v dnf >/dev/null; then
   dnf check-update || rc=$?
   [[ "${rc:-0}" -eq 0 || "${rc:-0}" -eq 100 ]]
 else
   echo "unsupported_package_manager=true"
   exit 69
 fi
} | tee "$output"
