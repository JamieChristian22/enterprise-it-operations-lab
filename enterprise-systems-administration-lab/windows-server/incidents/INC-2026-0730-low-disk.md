# INC-2026-0730 — Application Server Low Disk Space

- **Priority:** P3
- **Opened:** July 30, 2026, 07:45 ET
- **Resolved:** July 30, 2026, 08:08 ET

## Symptom

Health report showed `C:` at 17.8% free space on NSS-APP01.

## Findings

IIS logs retained 61 days of data despite the 30-day standard. No application data loss or service interruption occurred.

## Resolution

Archived days 31–61 to the data volume, deleted the verified local copies, and corrected the cleanup scheduled task. Free space increased to 34.6%.

## Prevention

Scheduled task now writes an execution log, returns a nonzero exit code on failure, and is checked weekly.
