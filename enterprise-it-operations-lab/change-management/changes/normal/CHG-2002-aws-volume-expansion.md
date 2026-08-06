# CHG-2002 — Expand AWS Application Volume

**Type:** Normal  
**Risk score:** 9 — Medium  
**Requester:** Cloud Operations  
**Owner:** Application Services  
**Implementer:** Cloud Engineer  
**Window:** 2026-07-23 21:00–22:00 ET

## Business Justification

Application volume exceeded 80% utilization and was forecast to breach capacity within 30 days.

## Pre-Change Validation

- Current volume: 200 GiB
- Snapshot completed
- Instance healthy
- Filesystem type: XFS
- CloudWatch alarms reviewed

## Implementation

1. Expand EBS volume to 300 GiB.
2. Confirm new block-device size.
3. Extend partition.
4. Grow XFS filesystem.
5. Validate application and logs.

## Test Plan

- Application login
- Write/read test
- Disk alarm cleared
- Monitoring healthy

## Rollback

Restore the pre-change snapshot to a replacement volume and reattach.

## Result

Successful.
