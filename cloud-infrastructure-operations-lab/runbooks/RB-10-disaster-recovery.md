# Disaster Recovery Activation

**Owner:** Cloud Operations  
**Severity:** SEV-2 unless customer-wide impact requires SEV-1  
**Trigger:** Regional service loss or unrecoverable primary data corruption

## Immediate actions
1. Acknowledge the alert and create or link the incident record.
2. Confirm customer impact, affected environment, region, and start time.
3. Freeze unrelated changes and preserve logs before remediation.

## Diagnosis
Use: `Confirm incident severity, recovery point, dependency map, DNS readiness, backup integrity`. Compare metrics with the last known healthy period and recent change history.

## Recovery decision
Declare DR, restore database, deploy infrastructure from Terraform, validate secrets, shift DNS, run business transaction test.

## Escalation
Escalate to the incident commander immediately for revenue impact, security exposure, data-loss risk, or unsuccessful recovery after 30 minutes. Notify the application owner and database or network specialist when their component is implicated.

## Validation
RTO under 4 hours, RPO under 24 hours, executive and technical validation complete.

## Closure evidence
Attach commands, timestamps, graphs, ticket number, change or rollback reference, and follow-up action owners.
