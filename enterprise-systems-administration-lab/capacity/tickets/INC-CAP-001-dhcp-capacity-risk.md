# INC-CAP-001 — HQ DHCP Scope Capacity Risk

- Priority: High
- Opened: 2026-07-14 09:10
- Impact: New devices intermittently failed to obtain addresses.
- Finding: HQ-Users scope reached 84.4% utilization with 9 free addresses after reservations.
- Resolution: Reclaimed 11 stale leases, reduced lease duration to 4 days, and expedited CHG-CAP-002.
- Restored: 2026-07-14 10:02
- Root Cause: Headcount growth exceeded the original scope design.
