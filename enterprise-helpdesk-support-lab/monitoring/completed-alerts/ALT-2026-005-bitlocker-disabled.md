# ALT-2026-005 — BitLocker Protection Suspended

- Detected: 2026-07-24 11:08 ET
- Asset: LT-HR-007
- Severity: High
- Owner: Taylor Reed
- Related Incident: INC-2026-109
- Closed: 2026-07-24 11:52 ET

## Investigation

BitLocker protection remained suspended after a firmware update.

## Response

Protection was resumed with `manage-bde -protectors -enable C:` and the recovery key escrow was verified.

## Validation

- Protection status: On
- Encryption percentage: 100%
- Recovery key escrow: Confirmed
- Compliance status: Healthy

## Preventive Action

The compliance rule now alerts when protection remains suspended longer than 15 minutes.
