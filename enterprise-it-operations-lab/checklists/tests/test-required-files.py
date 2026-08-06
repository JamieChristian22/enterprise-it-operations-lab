from pathlib import Path

required = [
    "README.md",
    "templates/checklist-template.md",
    "daily/daily-operations-checklist.md",
    "weekly/weekly-infrastructure-health.md",
    "monthly/monthly-patch-compliance.md",
    "identity/user-onboarding.md",
    "maintenance/server-maintenance.md",
    "incident/major-incident.md",
    "recovery/disaster-recovery-activation.md",
]

missing = [item for item in required if not Path(item).is_file()]
if missing:
    raise SystemExit(f"Missing files: {missing}")

print("PASS required files")
