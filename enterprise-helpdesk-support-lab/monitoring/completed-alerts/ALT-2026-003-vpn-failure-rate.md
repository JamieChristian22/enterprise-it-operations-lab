# ALT-2026-003 — VPN Failure Rate Above 20%

- Detected: 2026-07-15 09:47 ET
- Service: VPN-GW-01
- Severity: High
- Owner: Alex Morgan
- Related Incident: INC-2026-097
- Closed: 2026-07-15 10:36 ET

## Investigation

Authentication logs showed RADIUS certificate validation failures after the gateway certificate expired.

## Response

The renewed certificate was installed, the service restarted, and user authentication retested.

## Validation

- Successful test logins: 5
- Failure rate after recovery: 1.8%
- Monitoring observation: 30 minutes healthy

## Preventive Action

A certificate-expiry alert was created for 30, 14, and 7 days before expiration.
