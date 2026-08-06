# Kubernetes Rollout Failure

**Owner:** Cloud Operations  
**Severity:** SEV-2 unless customer-wide impact requires SEV-1  
**Trigger:** Deployment ProgressDeadlineExceeded

## Immediate actions
1. Acknowledge the alert and create or link the incident record.
2. Confirm customer impact, affected environment, region, and start time.
3. Freeze unrelated changes and preserve logs before remediation.

## Diagnosis
Use: `kubectl rollout status; kubectl describe deploy; kubectl get events; kubectl logs --previous`. Compare metrics with the last known healthy period and recent change history.

## Recovery decision
Pause rollout, correct image/config/secret, or rollback with kubectl rollout undo; protect minimum availability.

## Escalation
Escalate to the incident commander immediately for revenue impact, security exposure, data-loss risk, or unsuccessful recovery after 30 minutes. Notify the application owner and database or network specialist when their component is implicated.

## Validation
All replicas ready, probes passing, error rate normal, rollout history recorded.

## Closure evidence
Attach commands, timestamps, graphs, ticket number, change or rollback reference, and follow-up action owners.
