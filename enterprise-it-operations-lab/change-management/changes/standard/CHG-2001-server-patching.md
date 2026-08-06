# CHG-2001 — Monthly Server Patching

**Type:** Standard  
**Risk:** Low  
**Owner:** Infrastructure Operations  
**Window:** 2026-07-20 22:00–02:00 ET

## Scope

- Windows Server monthly updates
- Ubuntu and Rocky Linux security updates
- Reboot coordination
- Post-patch validation

## Prechecks

- Backup success confirmed
- Replication healthy
- Disk space sufficient
- Monitoring alerts suppressed for approved window

## Implementation

1. Patch pilot ring.
2. Validate services.
3. Patch production application servers.
4. Patch infrastructure servers.
5. Reboot as required.
6. Validate monitoring and business services.

## Rollback

Remove offending update or restore from backup/snapshot when service impact is confirmed.

## Result

Successful.
