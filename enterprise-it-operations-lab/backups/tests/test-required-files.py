from pathlib import Path

required = [
    "README.md",
    "policies/backup-policy.md",
    "policies/immutable-backup-standard.md",
    "procedures/windows-server-backup.md",
    "procedures/linux-backup.md",
    "automation/Test-BackupFreshness.ps1",
    "restore-tests/restore-test-2026-07-active-directory.md",
    "reports/monthly-backup-summary.md",
]

missing = [path for path in required if not Path(path).is_file()]
if missing:
    raise SystemExit(f"Missing required files: {missing}")

print("PASS required files")
