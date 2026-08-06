# SQL Application Recovery Runbook

1. Restore the latest full database backup.
2. Apply differential and transaction-log backups through the approved recovery point.
3. Run database integrity validation.
4. Map service accounts and verify permissions.
5. Start the application service in maintenance mode.
6. Execute smoke tests for authentication, search, create, update, and reporting.
7. Reconcile transaction counts with the last pre-disaster control total.
8. Obtain application-owner acceptance.
