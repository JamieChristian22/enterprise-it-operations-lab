#!/usr/bin/env bash
set -Eeuo pipefail
prometheus_url="${PROMETHEUS_URL:-http://localhost:9090}"

response="$(curl -fsS "$prometheus_url/api/v1/targets")"
python3 - "$response" <<'PY'
import json, sys
payload = json.loads(sys.argv[1])
targets = payload["data"]["activeTargets"]
down = []
for target in targets:
    state = target.get("health")
    name = target.get("labels", {}).get("instance")
    job = target.get("labels", {}).get("job")
    print(f"{state.upper()} job={job} instance={name}")
    if state != "up":
        down.append((job, name))
if down:
    raise SystemExit(1)
PY
