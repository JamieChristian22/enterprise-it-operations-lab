# CHG-2026-046 — Monitoring Agent Upgrade

- Type: Normal
- Risk: Moderate
- Status: Backed Out

## Objective
Upgrade the monitoring agent from 7.2 to 7.4 on `APP01`.

## Failure
The new agent failed to load the legacy application performance module, causing incomplete telemetry.

## Rollback
Uninstalled 7.4, restored 7.2 package, restored configuration backup, and restarted the agent.

## Validation
Metrics resumed within six minutes. Application service remained available throughout.

## PIR Action
Add module compatibility validation to the pre-change test plan and require vendor matrix review.
