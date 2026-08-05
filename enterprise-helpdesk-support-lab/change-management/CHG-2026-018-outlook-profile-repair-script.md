# CHG-2026-018 — Outlook Profile Repair Script Deployment

## Record Summary

| Field | Value |
|---|---|
| Change Type | Standard |
| Status | Closed — Successful |
| Change Owner | Jamie Christian II |
| Service Owner | End User Computing Lead |
| Related Records | INC-2026-088, INC-2026-091, INC-2026-097 |
| Planned Window | 2026-07-17 18:00–18:30 ET |
| Actual Window | 2026-07-17 18:02–18:19 ET |

## Executive Summary

A signed PowerShell diagnostic and repair script was added to the Help Desk toolkit to standardize first-line Outlook profile remediation. The script collects profile details, closes Outlook safely, clears designated local cache files, and records execution results without deleting mailbox data.

## Business Justification

Three recurring Outlook incidents showed inconsistent technician troubleshooting and incomplete evidence collection. A controlled script reduced manual variation and improved repeatability.

## Scope

- Help Desk admin workstation
- Approved support toolkit
- Windows 11 test endpoint
- Outlook desktop client cache troubleshooting

## Risk Assessment

| Factor | Score |
|---|---:|
| Likelihood | 1 |
| User impact | 2 |
| Criticality | 2 |
| Rollback complexity | 1 |
| Security exposure | 2 |

**Total:** 8 — Low

## Implementation

1. Verified script signature and SHA-256 hash.
2. Copied the approved script to the Help Desk toolkit.
3. Restricted modification permissions to IT administrators.
4. Executed the script against a test Outlook profile.
5. Confirmed Outlook reopened successfully.
6. Confirmed the execution log contained start time, endpoint, technician, actions, and result.
7. Updated the support runbook with approved usage conditions.

## Validation

| Test | Result |
|---|---|
| Script signature valid | Passed |
| Standard user mailbox data preserved | Passed |
| Outlook reopened | Passed |
| Execution log generated | Passed |
| Non-admin modification blocked | Passed |

## Rollback

Remove the script from the toolkit, restore the previous runbook version, and delete the approved-tool reference from the knowledge base. Estimated rollback time: 10 minutes.

## Approval

Pre-authorized as a standard change by the End User Computing Service Owner on 2026-07-15.

## Outcome

The tool was deployed successfully with no user interruption. The first controlled use reduced the documented troubleshooting time from 22 minutes to 11 minutes in the simulated test case.
