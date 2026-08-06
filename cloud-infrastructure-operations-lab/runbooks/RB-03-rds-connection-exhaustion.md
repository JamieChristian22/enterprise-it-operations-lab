# RDS Connection Exhaustion

**Owner:** Cloud Operations  
**Severity:** SEV-2 unless customer-wide impact requires SEV-1  
**Trigger:** DatabaseConnections above 85% of max

## Immediate actions
1. Acknowledge the alert and create or link the incident record.
2. Confirm customer impact, affected environment, region, and start time.
3. Freeze unrelated changes and preserve logs before remediation.

## Diagnosis
Use: `aws rds describe-db-instances; review pg_stat_activity; inspect application pool settings`. Compare metrics with the last known healthy period and recent change history.

## Recovery decision
Terminate confirmed idle-abandoned sessions, reduce pool size, scale DB only under approved emergency change, correct connection leak.

## Escalation
Escalate to the incident commander immediately for revenue impact, security exposure, data-loss risk, or unsuccessful recovery after 30 minutes. Notify the application owner and database or network specialist when their component is implicated.

## Validation
Connections below 60%, application error rate normal, no blocked transactions.

## Closure evidence
Attach commands, timestamps, graphs, ticket number, change or rollback reference, and follow-up action owners.
