# PRB-BKP-001 — Unexpected Backup Repository Growth

## Trend
Primary repository utilization increased from 49% to 61% in nine days.

## Root Cause
A new APP01 application log directory was included in the backup scope and retained high-volume transient logs that were already exported to centralized logging.

## Corrective Action
Application owner approved exclusion of the transient cache and duplicate exported logs. The next full backup reduced protected data by 620 GB. Retention cleanup returned repository utilization to 57%.

## Prevention
Added backup-scope review to application change management and monthly capacity forecasting.
