# Escalation Matrix

| Condition | Escalate To | Information Required |
|---|---|---|
| Multiple users affected | Service Desk Lead / M365 Admin | User count, locations, timestamps |
| Microsoft 365 service incident | M365 Admin / Incident Manager | Service-health advisory ID |
| Conditional Access or MFA policy issue | Identity Team | Sign-in logs, correlation ID |
| Quick and Online Repair fail | Endpoint Engineering | Event logs, Office build, repair logs |
| Profile recreation fails | M365 Admin / Endpoint Engineering | Profile state, Autodiscover results |
| Suspected malware | Security Operations | Defender alerts, process and hash details |
| Hardware instability | Desktop Engineering | Reliability history, diagnostics |
| Mailbox corruption or Exchange issue | Exchange Online Team | Mailbox tests, web access results |
| VIP or executive impact | Service Desk Lead | Business impact and communication plan |

## Escalation Quality Standard
An escalation must contain:
- Clear symptom
- Business impact
- Environment
- Exact timestamps
- Steps completed
- Evidence collected
- Results
- Specific assistance requested
