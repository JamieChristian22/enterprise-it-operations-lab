# CHG-2005 — Failed Application Deployment

**Type:** Normal  
**Risk:** High  
**Result:** Failed and rolled back

## Objective

Deploy application version 4.8.

## Failure

A required service dependency was not included in pre-production testing.

## Rollback

Version 4.7 was restored successfully.

## Impact

- 18 minutes of degraded service
- One P2 incident created
- No data loss

## Corrective Actions

- Add dependency checklist
- Expand integration testing
- Require service-owner signoff
