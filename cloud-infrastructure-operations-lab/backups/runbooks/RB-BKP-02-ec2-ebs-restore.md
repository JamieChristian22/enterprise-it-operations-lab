# EC2 and EBS Recovery

## Trigger

Use for an unrecoverable instance, corrupted root volume, deleted data volume, or regional recovery exercise.

## Steps

1. Identify the most recent successful recovery point in AWS Backup.
2. Confirm the recovery point is encrypted with the approved KMS key and is in the required region.
3. Restore the EBS volume or EC2 instance using the `BackupRestoreOperator` role.
4. For a volume restore, stop the affected instance, detach the damaged volume, attach the restored volume with a temporary device name, and inspect the filesystem before promotion.
5. On Linux, identify and mount the restored device:
   ```bash
   lsblk -f
   sudo mkdir -p /mnt/recovery
   sudo mount /dev/nvme1n1p1 /mnt/recovery
   sudo find /mnt/recovery -maxdepth 2 -type f | head
   ```
6. Validate file counts, application configuration, package state, CloudWatch agent status, and SSM connectivity.
7. Replace the failed instance through the launch template or attach the validated volume during an approved change.
8. Confirm ALB health, application response, logs, alarms, and backup assignment.

## Rollback and cleanup

Return traffic to the previous healthy target, detach the restored volume, and retain it for seven days under incident hold. Terminate temporary instances only after evidence is complete.
