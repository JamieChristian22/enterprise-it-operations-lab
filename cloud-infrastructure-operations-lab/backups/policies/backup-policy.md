# Backup and Recovery Policy

**Policy owner:** Cloud Infrastructure Operations  
**Approved by:** Director of Technology Operations  
**Effective date:** 2026-07-01  
**Review cycle:** Annual and after every Severity 1 recovery event

## Purpose

The organization shall maintain recoverable, encrypted, monitored, and tested backups for systems whose loss would disrupt customer service, security, compliance, or internal operations.

## Requirements

1. Every production resource must be registered in `inventory/protected-resources.csv` and assigned a recovery tier.
2. Tier 0 databases must use continuous or transaction-log recovery when supported, plus daily recovery points.
3. Tier 0 and Tier 1 recovery points must be copied to a secondary region or logically isolated vault.
4. Backup data must be encrypted at rest and in transit. Customer-managed keys are required for Tier 0.
5. Backup administrators may create and restore recovery points but may not unilaterally reduce retention or disable immutability.
6. Failed, expired, or missed jobs must alert the operations queue within 15 minutes.
7. Tier 0 restore tests occur monthly; Tier 1 quarterly; Tier 2 semiannually; Tier 3 annually.
8. Restore tests must validate integrity, application function, access controls, and cleanup.
9. Recovery points must not contain plaintext credentials, private keys, or unmanaged secrets.
10. Exceptions require a documented risk acceptance, owner, expiration date, and compensating control.

## Retention

| Backup class | Retention |
|---|---:|
| Transaction-log / point-in-time recovery | 35 days |
| Daily recovery point | 35 days |
| Weekly recovery point | 12 weeks |
| Monthly recovery point | 13 months |
| Annual recovery point | 7 years |
| Restore-test evidence | 3 years |

## Monitoring and escalation

A single failed job is investigated during the same support shift. Two consecutive failures for a Tier 0 or Tier 1 resource are escalated as a Priority 1 operational incident. A missed Tier 0 recovery point that exceeds RPO is immediately escalated to the incident commander and service owner.

## Compliance measurement

Monthly reporting measures backup success rate, protected-resource coverage, RPO compliance, restore-test pass rate, age of last successful recovery point, unresolved failures, and policy exceptions.
