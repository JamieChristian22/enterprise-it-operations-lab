from __future__ import annotations
import csv, sys
from pathlib import Path

def main() -> None:
    if len(sys.argv) < 2:
        raise SystemExit("Usage: validate_csv.py file.csv [required_column ...]")
    path, required = Path(sys.argv[1]), set(sys.argv[2:])
    with path.open(newline="", encoding="utf-8") as handle:
        reader = csv.DictReader(handle)
        rows, headers = list(reader), set(reader.fieldnames or [])
    missing = required - headers
    if missing:
        raise SystemExit(f"Missing columns: {sorted(missing)}")
    if not rows:
        raise SystemExit("CSV has no data rows")
    print(f"PASS {path}: {len(rows)} rows")

if __name__ == "__main__":
    main()
