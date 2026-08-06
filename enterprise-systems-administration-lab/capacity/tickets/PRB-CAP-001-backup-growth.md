# PRB-CAP-001 — Backup Repository Growth

- Symptom: BR01 growth averaged 19.4 GB per day.
- Root Cause: Monthly full backups remained on primary repository instead of being moved to offsite archive.
- Corrective Action: Automated archive transfer after verification and reduced primary full-backup retention from 12 to 8 weeks.
- Expected Benefit: Reduce daily net growth to approximately 8.1 GB.
