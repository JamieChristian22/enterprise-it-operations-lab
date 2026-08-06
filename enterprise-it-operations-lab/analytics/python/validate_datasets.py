from __future__ import annotations
import csv
from pathlib import Path

REQUIRED = {
    "service_tickets.csv": {"ticket_id","opened_date","category","priority","resolution_minutes","first_contact_resolved","csat_score","sla_met"},
    "patch_compliance.csv": {"snapshot_date","platform","assets","compliant_assets","exceptions"},
    "backup_jobs.csv": {"snapshot_date","workload","jobs","successful_jobs","failed_jobs"},
}

def main() -> None:
    raw = Path("data/raw")
    failures: list[str] = []
    for name, required in REQUIRED.items():
        path = raw / name
        with path.open(newline="", encoding="utf-8") as handle:
            reader = csv.DictReader(handle)
            rows = list(reader)
            columns = set(reader.fieldnames or [])
        missing = required - columns
        if missing:
            failures.append(f"{name}: missing {sorted(missing)}")
        if not rows:
            failures.append(f"{name}: no data rows")
        print(f"PASS {name}: {len(rows)} rows")
    if failures:
        raise SystemExit("\n".join(failures))

if __name__ == "__main__":
    main()
