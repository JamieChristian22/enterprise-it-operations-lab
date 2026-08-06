# Backup Role Matrix

| Capability | Administrator | Restore Operator | Auditor | Security Key Admin |
|---|---:|---:|---:|---:|
| Create backup plan | Yes | No | Read | No |
| Assign resources | Yes | No | Read | No |
| Start approved restore | Yes | Yes | No | No |
| Delete locked recovery point | No | No | No | No |
| Reduce retention | Change-approved | No | No | No |
| Read job and compliance data | Yes | Yes | Yes | Read |
| Modify encryption key | No | No | Read | Yes |
| Disable audit logging | No | No | No | No |

No role can independently weaken retention, delete keys, suppress logging, and delete protected recovery points.
