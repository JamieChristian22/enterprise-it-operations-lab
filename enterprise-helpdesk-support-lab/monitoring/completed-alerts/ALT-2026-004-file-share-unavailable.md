# ALT-2026-004 — File Share Unavailable Remotely

- Detected: 2026-07-22 09:01 ET
- Service: FS-01
- Severity: Critical
- Owner: Jamie Christian II
- Related Incident: INC-2026-104
- Closed: 2026-07-22 09:41 ET

## Investigation

The file server was healthy locally. Remote VPN clients could reach the DNS server by IP but used an incorrect public resolver.

## Response

The VPN DNS configuration was corrected through emergency change CHG-2026-021.

## Validation

- Internal name resolution: Passed
- File share access: Passed
- Two user tests: Passed
- Synthetic checks: Healthy

## Preventive Action

Peer review and DNS validation were added to VPN change controls.
