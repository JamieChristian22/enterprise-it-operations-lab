# SR-BKP-001 — Restore Deleted Finance Workbook

- Requester: Finance Operations Manager
- Requested: July 10, 2026 10:04 ET
- Completed: July 10, 2026 10:21 ET
- Priority: P3

## Request
Restore `\\FS01\Finance\FY2026-Budget.xlsx`, accidentally deleted at approximately 09:35 ET.

## Action
Selected the 08:00 recovery point, restored the workbook to a staging path, validated SHA-256 hash and NTFS permissions, then returned the file to the approved production folder.

## Result
The requester opened the workbook and confirmed all worksheets and formulas were intact. Total restoration time was 11 minutes. No production files were overwritten during validation.
