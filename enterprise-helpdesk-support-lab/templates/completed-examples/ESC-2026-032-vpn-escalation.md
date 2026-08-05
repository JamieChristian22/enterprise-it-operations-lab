# ESC-2026-032 — VPN Authentication Failure Escalation

## Escalation Summary

Multiple remote users could not authenticate to VPN. Failure rate exceeded 20%, and the issue required Network Engineering review.

## Scope

- Users affected: 11
- Service: VPN-GW-01
- Priority: High
- Departments: Sales, Finance, Operations

## Evidence Collected

- RADIUS certificate validation errors
- VPN gateway log timestamps
- Five failed test authentications
- Certificate expiration date
- Successful local Active Directory sign-ins

## Troubleshooting Already Completed

- Verified user credentials
- Confirmed AD availability
- Confirmed internet connectivity
- Restarted one test client
- Reproduced failure on three endpoints

## Workaround

No reliable workaround was available.

## Assistance Requested

Replace the expired RADIUS certificate and validate VPN authentication.

## Ownership

Escalated to Network Engineering at 10:01 ET. Next update due at 10:31 ET.
