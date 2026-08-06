# Capacity Management Plan

## Environment
The managed environment contains 8 Windows servers, 2 domain controllers, 1 DHCP service, 1 certificate authority, 1 backup repository, and 3 core business services.

## Measurement Cadence
- CPU and memory: 5-minute samples, summarized daily.
- Disk capacity and latency: hourly samples.
- DHCP utilization: every 30 minutes.
- Backup growth: daily after job completion.
- AD database size: weekly.
- Certificate issuance and expiry: daily.
- Patch duration: after each maintenance cycle.

## Thresholds
| Metric | Warning | Critical | Action |
|---|---:|---:|---|
| CPU average | 70% for 30 min | 85% for 15 min | Analyze processes and scale |
| Memory committed | 75% | 90% | Identify leak or add RAM |
| Disk utilization | 75% | 85% | Cleanup, archive, or expand |
| Disk latency | 15 ms | 25 ms | Investigate storage path |
| DHCP utilization | 75% | 85% | Reclaim leases or expand scope |
| Backup repository | 75% | 90% | Adjust retention or expand storage |
| Certificate expiry | 45 days | 15 days | Renew and validate |

## Forecasting Method
Linear daily growth is calculated from the most recent 30-day baseline. Forecasts are produced for 30, 60, and 90 days. A forecast is escalated when a resource is expected to cross its warning threshold within 90 days.

## Governance
Monthly capacity review meetings evaluate risks, forecasts, change requests, and budget implications. Critical risks are escalated immediately to Infrastructure Operations leadership.
