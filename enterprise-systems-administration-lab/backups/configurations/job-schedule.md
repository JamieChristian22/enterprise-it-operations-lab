# Backup Job Schedule

| Job | Schedule | Source | Target | Expected Duration |
|---|---|---|---|---:|
| AD-SystemState-4H | 00:00, 04:00, 08:00, 12:00, 16:00, 20:00 | DC01 | Primary repository | 18 min |
| FS01-Incremental-4H | Every 4 hours | FS01 data volumes | Primary repository | 35 min |
| APP01-Nightly | 23:00 daily | APP01 | Primary repository | 42 min |
| Weekly-Full | 22:00 Sunday | All protected assets | Primary repository | 3 hr 20 min |
| Offline-Copy | 03:30 daily | Latest verified points | Offline vault | 55 min |
| Offsite-Replication | 01:00 daily | Primary repository | Azure vault | 1 hr 25 min |
| Daily-Health-Report | 07:30 daily | Backup logs | Email/report folder | 3 min |
