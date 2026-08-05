# Incident Trend Report

## Major Incidents

| Incident | Priority | Duration | Users | Root Cause |
|---|---:|---:|---:|---|
| VPN DNS outage | P1 | 44 minutes | 18 | Configuration |
| Microsoft 365 mail disruption | P2 | 78 minutes | 26 | Authentication |
| AD authentication failure | P2 | 80 minutes | 14 | Credential dependency |

## Findings

All incidents were restored within target. The common themes were configuration validation, authentication lifecycle, and service-account dependencies.

## Preventive Actions

- VPN profile peer review
- DNS validation before deployment
- Outlook identity-change pilot group
- Scheduled-task service-account inventory
- Certificate and credential-expiry alerts

No repeat major incident occurred during the review period.
