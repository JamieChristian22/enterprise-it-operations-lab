# Windows Server Monthly Operations Report — July 2026

## Executive Summary

The Northstar Windows Server environment met availability, backup, patch, and security targets for July. Three incidents were resolved without data loss. One backup-capacity issue and one configuration-drift issue produced preventive actions that were completed before month-end.

## Scorecard

| Metric | Target | Result | Status |
|---|---:|---:|---|
| Server availability | >=99.5% | 99.86% | Met |
| Servers passing baseline | 100% | 100% | Met |
| Backup jobs successful | >=95% | 96.8% | Met |
| Latest backup age | <26 hours | 10.4 hours | Met |
| Patch compliance | 100% | 100% | Met |
| Critical open incidents | 0 | 0 | Met |
| Volumes with >=20% free | 100% | 100% | Met |
| Mean incident resolution time | <60 minutes | 34 minutes | Met |

## Incidents

- Backup failure caused by expired recovery points: resolved in 51 minutes.
- RDP firewall scope drift: resolved in 28 minutes.
- IIS log retention caused low disk alert: resolved in 23 minutes.

## Changes

- Department file services deployed successfully.
- July security and cumulative updates applied to four servers.

## Risks and Actions

1. Single domain controller remains a lab limitation. Production design requires redundancy.
2. Backup target is local to the file server. Production design requires off-host and immutable copies.
3. Weekly permission-drift review will be automated in the next iteration.

## Overall Status

**Green — operational objectives met with no unresolved high-severity findings.**
