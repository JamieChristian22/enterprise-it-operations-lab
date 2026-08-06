# INC-003 — Customer Portal Unavailable

**Severity:** Critical  
**Alert:** EndpointUnavailable

## Investigation
Blackbox Exporter showed failed TLS probes. The certificate had expired.

## Resolution
The certificate was renewed and the reverse proxy reloaded.

## Validation
Five consecutive probes succeeded and response latency returned below 400 ms.

## Prevention
Added certificate-expiration monitoring and a 30-day warning threshold.
