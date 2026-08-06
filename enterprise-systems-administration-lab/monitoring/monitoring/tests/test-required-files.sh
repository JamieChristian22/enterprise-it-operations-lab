#!/usr/bin/env bash
set -Eeuo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

test -f "$root/README.md"
test -f "$root/docker/docker-compose.yml"
test -f "$root/prometheus/config/prometheus.yml"
test -f "$root/alertmanager/alertmanager.yml"
test "$(find "$root/runbooks" -type f | wc -l)" -ge 10
test "$(find "$root/incidents" -type f | wc -l)" -ge 6
test "$(find "$root/grafana/dashboards" -type f -name '*.json' | wc -l)" -ge 6

echo "PASS required project content"
