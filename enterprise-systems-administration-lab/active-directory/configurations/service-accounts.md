# Service Account Register

| Account | Purpose | Type | Owner | Interactive Logon | Rotation |
|---|---|---|---|---|---|
| gmsa-backup$ | Backup agent service | gMSA | Infrastructure | Denied | Automatic |
| gmsa-monitor$ | Monitoring collector | gMSA | Infrastructure | Denied | Automatic |
| svc-legacyprint | Legacy print connector lab test | Managed password account | Systems Admin | Denied | 60 days |

All service identities have documented dependencies, least-privilege rights, non-expiring ownership review dates, and test plans before credential changes. `PasswordNeverExpires` is not accepted as a substitute for managed rotation.
