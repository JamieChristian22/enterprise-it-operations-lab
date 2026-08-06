# Production VM Failed to Start

| Field | Value |
|---|---|
| Priority | P1 |
| Platform | Hyper-V |
| Asset | PRD-FIN-01 |
| Technician | Jamie Christian |
| Status | Resolved |
| SLA | Met |

## Business Impact
Production availability or administrative control was materially affected.

## Root Cause
A test VM consumed excessive static memory, leaving insufficient startup memory.

## Resolution
Stopped the unauthorized test VM, enabled dynamic memory, and started PRD-FIN-01.

## Validation
VM running, finance app HTTP 200, monitoring clear, owner confirmed access.

## Preventive Action
Updated monitoring, operational documentation, and change-review controls to detect or prevent recurrence.
