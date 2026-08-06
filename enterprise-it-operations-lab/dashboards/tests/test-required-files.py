from pathlib import Path
required=[
"README.md",
"executive/enterprise-it-operations-dashboard.xlsx",
"screenshots/executive-dashboard-preview.png",
"datasets/monthly-kpis.csv",
"grafana/infrastructure-overview.json",
]
missing=[p for p in required if not Path(p).is_file()]
if missing: raise SystemExit(f"Missing: {missing}")
print("PASS required files")
