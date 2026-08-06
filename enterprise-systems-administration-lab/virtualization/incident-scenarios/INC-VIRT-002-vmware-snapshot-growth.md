# Snapshot Caused Datastore Capacity Alert

| Field | Value |
|---|---|
| Priority | P1 |
| Platform | VMware |
| Asset | DS-PROD-01 |
| Technician | Jamie Christian |
| Status | Resolved |
| SLA | Met |

## Business Impact
Production availability or administrative control was materially affected.

## Root Cause
A backup-created snapshot remained for 18 days and grew to 312 GB.

## Resolution
Restored backup-proxy connectivity and consolidated the stale snapshot.

## Validation
Free capacity returned above 30 percent and SQL tests passed.

## Preventive Action
Updated monitoring, operational documentation, and change-review controls to detect or prevent recurrence.
