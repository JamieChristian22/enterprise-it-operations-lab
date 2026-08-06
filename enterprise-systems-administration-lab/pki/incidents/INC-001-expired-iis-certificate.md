# INC-001 — Expired IIS Certificate

## Impact
The internal finance portal displayed a certificate expiration warning.

## Cause
The server certificate was manually enrolled and not included in expiration monitoring.

## Resolution
A new certificate was issued from the Northstar Web Server template and bound to IIS.

## Prevention
Added automated 30-day expiration reporting and auto-enrollment where supported.
