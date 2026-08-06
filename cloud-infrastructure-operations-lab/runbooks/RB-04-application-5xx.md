# Application 5xx Errors

**Owner:** Cloud Operations  
**Severity:** SEV-2 unless customer-wide impact requires SEV-1  
**Trigger:** 5xx rate above 5% for 10 minutes

## Immediate actions
1. Acknowledge the alert and create or link the incident record.
2. Confirm customer impact, affected environment, region, and start time.
3. Freeze unrelated changes and preserve logs before remediation.

## Diagnosis
Use: `CloudWatch Logs Insights query; ALB target health; deployment history; dependency status`. Compare metrics with the last known healthy period and recent change history.

## Recovery decision
Rollback bad release, isolate failing target, restore dependency connectivity, scale when saturation is confirmed.

## Escalation
Escalate to the incident commander immediately for revenue impact, security exposure, data-loss risk, or unsuccessful recovery after 30 minutes. Notify the application owner and database or network specialist when their component is implicated.

## Validation
5xx rate below 1% for 15 minutes and checkout smoke test passes.

## Closure evidence
Attach commands, timestamps, graphs, ticket number, change or rollback reference, and follow-up action owners.
