# ALB Unhealthy Targets

**Owner:** Cloud Operations  
**Severity:** SEV-2 unless customer-wide impact requires SEV-1  
**Trigger:** UnHealthyHostCount >= 1 for two minutes

## Immediate actions
1. Acknowledge the alert and create or link the incident record.
2. Confirm customer impact, affected environment, region, and start time.
3. Freeze unrelated changes and preserve logs before remediation.

## Diagnosis
Use: `aws elbv2 describe-target-health; curl -sv http://localhost/health; journalctl -u nginx --since "20 min ago"`. Compare metrics with the last known healthy period and recent change history.

## Recovery decision
Restore service, security-group path, or health endpoint; replace failed instance through ASG; revert latest deployment when failures correlate with release.

## Escalation
Escalate to the incident commander immediately for revenue impact, security exposure, data-loss risk, or unsuccessful recovery after 30 minutes. Notify the application owner and database or network specialist when their component is implicated.

## Validation
All targets healthy for 10 minutes and synthetic request returns HTTP 200.

## Closure evidence
Attach commands, timestamps, graphs, ticket number, change or rollback reference, and follow-up action owners.
