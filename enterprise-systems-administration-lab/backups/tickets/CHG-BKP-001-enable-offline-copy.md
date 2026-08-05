# CHG-BKP-001 — Implement Daily Offline Backup Copy

- Change type: Normal
- Risk: Medium
- Window: July 18, 2026 03:00–05:00 ET
- Status: Successfully completed

## Business Reason
Reduce ransomware and administrative-deletion risk by maintaining a disconnected recovery copy.

## Implementation
1. Encrypted `F:` with BitLocker.
2. Restricted ACLs to backup operators and service account.
3. Scheduled verified copy at 03:30 ET.
4. Configured post-copy dismount procedure.
5. Tested file and folder restoration from the offline vault.

## Validation
Copy completed in 49 minutes, checksum validation passed, and a test file restored in 12 minutes.

## Backout
Disable the scheduled copy task, disconnect the vault, and retain the previous verified weekly offline recovery point.
