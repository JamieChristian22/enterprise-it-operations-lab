from __future__ import annotations

import csv
from pathlib import Path


def main() -> None:
    failures: list[str] = []
    for path in Path(".").rglob("*.csv"):
        with path.open(newline="", encoding="utf-8") as handle:
            reader = csv.reader(handle)
            rows = list(reader)
        if len(rows) < 2:
            failures.append(f"{path}: missing data rows")
        elif len(set(map(len, rows))) != 1:
            failures.append(f"{path}: inconsistent column count")
        else:
            print(f"PASS {path}")

    if failures:
        raise SystemExit("\n".join(failures))


if __name__ == "__main__":
    main()
