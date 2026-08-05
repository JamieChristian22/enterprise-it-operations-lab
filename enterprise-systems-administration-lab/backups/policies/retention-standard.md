# Backup Retention Standard

| Tier | Frequency | Retention | Storage |
|---|---|---:|---|
| Operational | Every 4 hours | 7 days | Primary repository |
| Daily | Once nightly | 30 days | Primary + offsite |
| Weekly | Sunday full | 12 weeks | Primary + offline + offsite |
| Monthly | Last Sunday | 12 months | Offsite vault |
| Annual | December month-end | 7 years | Archive tier |

Expired points are removed through controlled lifecycle jobs. Manual deletion requires an approved change and backup-owner authorization.
