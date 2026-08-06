#!/usr/bin/env bash
set -Eeuo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
failed=0

required=(
  README.md
  docker/docker-compose.yml
  prometheus/config/prometheus.yml
  alertmanager/alertmanager.yml
  blackbox-exporter/blackbox.yml
  grafana/provisioning/datasources/prometheus.yml
)

for item in "${required[@]}"; do
  if [[ -s "$root_dir/$item" ]]; then
    echo "PASS $item"
  else
    echo "FAIL $item"
    failed=1
  fi
done

if find "$root_dir" -type f -empty | grep -q .; then
  echo "FAIL empty files found"
  failed=1
else
  echo "PASS no empty files"
fi

python3 - <<'PY'
from pathlib import Path
import json, sys
root = Path(__file__).resolve().parent.parent if "__file__" in globals() else Path(".")
for path in Path("grafana/dashboards").glob("*.json"):
    json.loads(path.read_text())
    print(f"PASS JSON {path}")
PY

exit "$failed"
