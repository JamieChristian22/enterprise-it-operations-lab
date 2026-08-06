# AWS Backup Failure

**Owner:** Cloud Operations  
**Severity:** SEV-2 unless customer-wide impact requires SEV-1  
**Trigger:** Backup job status FAILED or EXPIRED

## Immediate actions
1. Acknowledge the alert and create or link the incident record.
2. Confirm customer impact, affected environment, region, and start time.
3. Freeze unrelated changes and preserve logs before remediation.

## Diagnosis
Use: `aws backup list-backup-jobs; CloudTrail lookup for denied actions; verify vault and KMS access`. Compare metrics with the last known healthy period and recent change history.

## Recovery decision
Correct IAM/KMS policy, retry on-demand backup, preserve failed-job evidence, schedule restore test.

## Escalation
Escalate to the incident commander immediately for revenue impact, security exposure, data-loss risk, or unsuccessful recovery after 30 minutes. Notify the application owner and database or network specialist when their component is implicated.

## Validation
New recovery point COMPLETED and restore validation documented.

## Closure evidence
Attach commands, timestamps, graphs, ticket number, change or rollback reference, and follow-up action owners.
