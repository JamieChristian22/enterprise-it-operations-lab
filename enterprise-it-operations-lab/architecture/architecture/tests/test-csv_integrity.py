from pathlib import Path
import csv

for path in Path(".").rglob("*.csv"):
    with path.open(newline="", encoding="utf-8") as handle:
        rows = list(csv.reader(handle))
    if len(rows) < 2:
        raise SystemExit(f"{path}: no data rows")
    widths = {len(row) for row in rows}
    if len(widths) != 1:
        raise SystemExit(f"{path}: inconsistent columns")
    print(f"PASS {path}")
