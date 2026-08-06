# CHG-CAP-001 — Expand FS01 Storage

- Type: Normal Change
- Risk: Medium
- Window: 2026-08-08 22:00–23:00
- Plan: Add 2 TB virtual disk, extend D: volume, validate file shares and monitoring.
- Rollback: Remove unformatted disk before volume extension; restore snapshot only if validation fails.
- Success Criteria: D: capacity increases to 6 TB, shares remain accessible, and monitoring reports below 55% utilization.
- Approval: Infrastructure Manager and Change Advisory Board.
