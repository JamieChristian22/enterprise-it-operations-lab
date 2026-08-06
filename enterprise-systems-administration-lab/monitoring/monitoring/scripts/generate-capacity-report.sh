#!/usr/bin/env bash
set -Eeuo pipefail
prometheus_url="${PROMETHEUS_URL:-http://localhost:9090}"
output="${1:-capacity-report.txt}"

query() {
  curl -fsSG "$prometheus_url/api/v1/query" --data-urlencode "query=$1"
}

{
  echo "Northstar Capacity Snapshot"
  date --iso-8601=seconds
  echo
  echo "CPU:"
  query 'instance:cpu_utilization:percent'
  echo
  echo "Memory:"
  query 'instance:memory_available:percent'
  echo
  echo "Filesystem:"
  query 'instance:filesystem_free:percent'
} > "$output"

echo "Created $output"
