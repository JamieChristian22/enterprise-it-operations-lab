#!/usr/bin/env python3
import csv, sys
from datetime import datetime, timezone
required={"resource_id","backup_time_utc","status","restore_tested","recovery_point_age_hours"}
path=sys.argv[1] if len(sys.argv)>1 else "datasets/backup-validation.csv"
with open(path,newline="",encoding="utf-8") as f:
    rows=list(csv.DictReader(f))
missing=required-set(rows[0]) if rows else required
if missing: raise SystemExit(f"Missing columns: {sorted(missing)}")
failed=[r for r in rows if r["status"]!="COMPLETED" or float(r["recovery_point_age_hours"])>24]
print(f"Checked {len(rows)} backup records at {datetime.now(timezone.utc).isoformat()}")
for r in failed: print(f"NONCOMPLIANT {r['resource_id']} status={r['status']} age={r['recovery_point_age_hours']}h")
raise SystemExit(1 if failed else 0)
