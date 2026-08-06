# INC-005 — Alert Storm During Network Maintenance

**Severity:** Medium

## Summary
Planned network maintenance produced 48 child alerts.

## Root Cause
Maintenance mode had not been applied, and dependency alerts were not inhibited.

## Resolution
A scoped silence was applied. Alertmanager inhibition rules were updated.

## Prevention
Added a maintenance checklist and parent-child alert suppression.
