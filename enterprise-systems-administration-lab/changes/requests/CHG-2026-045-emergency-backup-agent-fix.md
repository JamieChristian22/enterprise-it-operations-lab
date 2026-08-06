# CHG-2026-045 — Emergency Backup Agent Repair

- Type: Emergency
- Risk: High
- Status: Successful
- Related incident: INC-2026-118

## Trigger
Backup agent on `SQL01` stopped communicating after a certificate rollover, placing the nightly recovery point at risk.

## Action
Renewed the agent certificate, restarted services, forced inventory, and ran an on-demand incremental backup.

## Validation
Backup completed successfully, repository checksum passed, and restore-point visibility returned.

## Retrospective
CAB approved the emergency action and required certificate-expiration monitoring at 30/14/7 days.
