# False-Positive and Alert-Tuning Review

## Review Date

August 4, 2026

## Findings

| Alert | Finding | Decision |
|---|---|---|
| Endpoint offline | Approved leave caused one 24-hour alert | Add maintenance-calendar suppression |
| Disk capacity | Threshold correctly identified risk | Retain |
| Print backlog | One large approved print job triggered alert | Retain; require sustained backlog |
| BitLocker suspended | Firmware process briefly suspended protection | Retain 15-minute delay |
| VPN failures | Correctly detected certificate issue | Retain |

## Controls

- Suppressions require an owner and expiration.
- Critical alerts cannot be permanently suppressed.
- Recurring false positives require threshold redesign.
- Every tuning change is reviewed after 30 days.
