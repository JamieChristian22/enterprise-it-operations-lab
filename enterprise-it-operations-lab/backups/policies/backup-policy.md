# Backup Policy

## Tier 1 — Critical

Examples:

- Active Directory
- File services
- PKI
- Core databases
- Business-critical applications

Targets:

- RPO: 4 hours
- RTO: 4 hours
- Retention: 30 daily, 12 monthly, 7 yearly
- Immutable copy required
- Monthly restore test

## Tier 2 — Important

Examples:

- Department applications
- Utility servers
- Internal collaboration data

Targets:

- RPO: 12 hours
- RTO: 8 hours
- Retention: 14 daily, 6 monthly
- Offsite copy required
- Quarterly restore test

## Tier 3 — Standard

Examples:

- Rebuildable systems
- Lab servers
- Non-critical data

Targets:

- RPO: 24 hours
- RTO: 24 hours
- Retention: 7 daily, 3 monthly
- Semiannual restore test
