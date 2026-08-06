from __future__ import annotations
import csv, sys
from pathlib import Path

def main() -> None:
    if len(sys.argv) != 3:
        raise SystemExit("Usage: capacity_forecast.py trend.csv threshold")
    path, threshold = Path(sys.argv[1]), float(sys.argv[2])
    with path.open(newline="", encoding="utf-8") as handle:
        values = [float(row["UtilizationPercent"]) for row in csv.DictReader(handle)]
    if len(values) < 2:
        raise SystemExit("At least two rows are required")
    growth = values[-1] - values[-2]
    if growth <= 0:
        print("No positive growth trend detected")
        return
    months = max(0.0, (threshold - values[-1]) / growth)
    print(f"Current utilization: {values[-1]:.1f}%")
    print(f"Latest monthly growth: {growth:.1f} points")
    print(f"Estimated months to {threshold:.1f}%: {months:.1f}")

if __name__ == "__main__":
    main()
