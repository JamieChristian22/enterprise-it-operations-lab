# Azure VM Restore

## Procedure

1. Open the Recovery Services Vault and confirm the VM has a successful recovery point within RPO.
2. Select **Restore VM** and choose **Create new virtual machine** for production recovery; do not replace the source during initial validation.
3. Restore into the isolated recovery virtual network and approved resource group.
4. Verify disk encryption, network security group assignment, managed identity, boot diagnostics, and monitoring extension.
5. Connect through Azure Bastion or approved private access and validate:
   ```bash
   systemctl --failed
   df -h
   journalctl -p err --since '2 hours ago'
   curl -fsS http://localhost:8080/health
   ```
6. Run application and data-integrity tests. Record actual restore duration.
7. Place the recovered VM behind the load balancer only after the service owner approves validation.
8. Confirm Azure Monitor heartbeat, log ingestion, alerts, backup policy assignment, and vulnerability-management status.

## Failure handling

For authorization, soft-delete, key, quota, or network failures, preserve the error text, correlation ID, vault job ID, and timestamp; then follow `RB-BKP-08-backup-job-failure.md`.
