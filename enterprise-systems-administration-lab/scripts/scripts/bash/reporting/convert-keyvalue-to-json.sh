#!/usr/bin/env bash
set -Eeuo pipefail
input="${1:?Usage: $0 input.txt output.json}"
output="${2:?Usage: $0 input.txt output.json}"
python3 - "$input" "$output" <<'PY'
import json,sys
data={}
for line in open(sys.argv[1],encoding="utf-8"):
    line=line.strip()
    if line and "=" in line:
        key,value=line.split("=",1)
        data[key]=value
json.dump(data,open(sys.argv[2],"w"),indent=2)
PY
