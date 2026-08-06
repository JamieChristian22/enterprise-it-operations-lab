#!/usr/bin/env bash
set -Eeuo pipefail
threshold_file="${1:-config/thresholds.example.json}"
output="${2:-output/linux-health.json}"
command -v python3 >/dev/null || { echo "python3 required" >&2; exit 69; }
readarray -t limits < <(python3 - "$threshold_file" <<'PY'
import json,sys
d=json.load(open(sys.argv[1]))
print(d["disk_warning_percent"])
print(d["memory_available_warning_percent"])
PY
)
disk="$(df -P / | awk 'NR==2 {gsub("%","",$5);print $5}')"
memory="$(free | awk '/Mem:/ {printf "%.0f",($7/$2)*100}')"
failed_units="$(systemctl --failed --no-legend --plain 2>/dev/null | wc -l | tr -d ' ')"
status=0
(( disk >= limits[0] )) && status=1
(( memory <= limits[1] )) && status=1
(( failed_units > 0 )) && status=1
mkdir -p "$(dirname "$output")"
python3 - "$output" "$disk" "$memory" "$failed_units" "$status" <<'PY'
import json,sys,datetime
path,disk,mem,units,status=sys.argv[1:]
json.dump({"timestamp":datetime.datetime.now(datetime.timezone.utc).isoformat(),
"disk_usage_percent":int(disk),"memory_available_percent":int(mem),
"failed_units":int(units),"passed":status=="0"},open(path,"w"),indent=2)
PY
cat "$output"
exit "$status"
