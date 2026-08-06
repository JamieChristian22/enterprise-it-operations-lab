# IAM Access Review

**Owner:** Cloud Operations  
**Severity:** SEV-2 unless customer-wide impact requires SEV-1  
**Trigger:** Quarterly review or privileged-access alert

## Immediate actions
1. Acknowledge the alert and create or link the incident record.
2. Confirm customer impact, affected environment, region, and start time.
3. Freeze unrelated changes and preserve logs before remediation.

## Diagnosis
Use: `aws iam generate-credential-report; access advisor; Azure role assignment export`. Compare metrics with the last known healthy period and recent change history.

## Recovery decision
Disable unused keys, remove stale memberships, replace broad policies with scoped roles, document owner approval.

## Escalation
Escalate to the incident commander immediately for revenue impact, security exposure, data-loss risk, or unsuccessful recovery after 30 minutes. Notify the application owner and database or network specialist when their component is implicated.

## Validation
No unauthorized privileged access, stale credentials removed, review signed off.

## Closure evidence
Attach commands, timestamps, graphs, ticket number, change or rollback reference, and follow-up action owners.
