# Change Advisory Board Operating Guide

## Purpose

The Change Advisory Board reviews planned normal changes to confirm business value, technical readiness, risk control, scheduling, communication, and rollback capability.

## Membership

| Role | Responsibility |
|---|---|
| CAB Chair | Facilitates decisions and resolves approval conflicts |
| Change Manager | Presents schedule, conflicts, and record quality |
| Service Owner | Confirms business need and accepts service risk |
| Technical Reviewer | Validates implementation and rollback steps |
| Security Reviewer | Evaluates security and access-control effects |
| Service Desk Representative | Confirms user communication and support readiness |

## Meeting Agenda

1. Review previous change outcomes.
2. Review failed, backed-out, and emergency changes.
3. Identify schedule conflicts and blackout periods.
4. Review each proposed change:
   - Business justification
   - Risk score
   - Systems affected
   - Implementation plan
   - Validation plan
   - Rollback plan
   - Communication readiness
5. Record approval decision and conditions.
6. Confirm ownership and implementation window.

## Decision Options

- **Approved:** Ready to schedule and implement.
- **Approved with conditions:** May proceed after specified conditions are met.
- **Deferred:** More information, testing, or scheduling review is required.
- **Rejected:** Risk or value does not justify implementation.
- **Cancelled:** Requester withdraws the change.

## Minimum Approval Evidence

A normal change must contain:

- Complete scope
- Named owner
- Risk score and rationale
- Tested or technically credible rollback
- Validation criteria
- Maintenance window
- Stakeholder communication
- Dependency confirmation

## Sample CAB Decision Log

| Change ID | Decision | Conditions | Decision Owner |
|---|---|---|---|
| CHG-2026-014 | Approved | Confirm Group Policy backup before implementation | CAB Chair |
| CHG-2026-018 | Pre-authorized standard | Use signed script version and retain execution log | Service Owner |
| CHG-2026-021 | Emergency approved | Retrospective review required next business day | Emergency Change Authority |
