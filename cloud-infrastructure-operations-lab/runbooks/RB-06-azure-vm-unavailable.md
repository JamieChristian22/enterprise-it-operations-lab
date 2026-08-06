# Azure VM Unavailable

**Owner:** Cloud Operations  
**Severity:** SEV-2 unless customer-wide impact requires SEV-1  
**Trigger:** Availability signal or heartbeat missing

## Immediate actions
1. Acknowledge the alert and create or link the incident record.
2. Confirm customer impact, affected environment, region, and start time.
3. Freeze unrelated changes and preserve logs before remediation.

## Diagnosis
Use: `Get-AzVM -Status; Network Watcher connection troubleshoot; boot diagnostics; Log Analytics heartbeat query`. Compare metrics with the last known healthy period and recent change history.

## Recovery decision
Restart only after collecting diagnostics; redeploy host if platform fault persists; restore from vault if disk corruption confirmed.

## Escalation
Escalate to the incident commander immediately for revenue impact, security exposure, data-loss risk, or unsuccessful recovery after 30 minutes. Notify the application owner and database or network specialist when their component is implicated.

## Validation
VM running, heartbeat present, load-balancer probe healthy, application smoke test passes.

## Closure evidence
Attach commands, timestamps, graphs, ticket number, change or rollback reference, and follow-up action owners.
