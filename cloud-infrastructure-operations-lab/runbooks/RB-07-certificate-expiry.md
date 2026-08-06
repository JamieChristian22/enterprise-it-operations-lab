# Certificate Expiry

**Owner:** Cloud Operations  
**Severity:** SEV-2 unless customer-wide impact requires SEV-1  
**Trigger:** Certificate expires within 30 days

## Immediate actions
1. Acknowledge the alert and create or link the incident record.
2. Confirm customer impact, affected environment, region, and start time.
3. Freeze unrelated changes and preserve logs before remediation.

## Diagnosis
Use: `openssl s_client; aws acm list-certificates; Get-AzKeyVaultCertificate`. Compare metrics with the last known healthy period and recent change history.

## Recovery decision
Renew or import replacement, bind to listener, validate chain and hostname, remove expired certificate after observation window.

## Escalation
Escalate to the incident commander immediately for revenue impact, security exposure, data-loss risk, or unsuccessful recovery after 30 minutes. Notify the application owner and database or network specialist when their component is implicated.

## Validation
TLS handshake succeeds, correct SANs present, expiry exceeds 90 days.

## Closure evidence
Attach commands, timestamps, graphs, ticket number, change or rollback reference, and follow-up action owners.
