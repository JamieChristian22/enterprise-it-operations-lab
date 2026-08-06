# Database Backup

## Requirements

- Application-consistent backup
- Transaction-log or WAL protection
- Full and incremental backup strategy
- Restore validation to isolated database
- Integrity checks after restore
- Recovery-point and recovery-time measurements

## Example Validation

- Database opens
- Row counts match
- Application connects
- Point-in-time recovery succeeds
