from pathlib import Path

required = [
    "README.md",
    "policies/change-management-policy.md",
    "policies/change-types-and-risk-model.md",
    "templates/change-request-template.md",
    "changes/emergency/CHG-2004-critical-vulnerability.md",
    "changes/failed/PIR-CHG-2005.md",
    "calendar/forward-schedule-of-change.csv",
    "reports/monthly-change-summary.md",
]

missing = [item for item in required if not Path(item).is_file()]
if missing:
    raise SystemExit(f"Missing required files: {missing}")

print("PASS required files")
