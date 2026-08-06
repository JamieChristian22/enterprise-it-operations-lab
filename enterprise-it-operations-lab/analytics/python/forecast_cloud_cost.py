from __future__ import annotations
import csv
from pathlib import Path

def main() -> None:
    totals: dict[str, float] = {}
    with Path("data/raw/cloud_costs.csv").open(newline="", encoding="utf-8") as handle:
        for row in csv.DictReader(handle):
            totals[row["month"]] = totals.get(row["month"], 0.0) + float(row["cost_usd"])
    months = sorted(totals)
    growth = totals[months[-1]] - totals[months[-2]]
    forecast = totals[months[-1]] + growth
    print(f"Latest monthly cost: ${totals[months[-1]]:,.2f}")
    print(f"Linear next-month forecast: ${forecast:,.2f}")

if __name__ == "__main__":
    main()
