# INC-2026-041 — Help Desk GPO Not Applying

## Summary

`CORP-HD-Admin-Tools-v1.0` did not apply to `NS-HD-WS01` after the workstation was moved into the Help Desk OU.

## Investigation

- The OU location and link were correct.
- `gpresult` listed the GPO under Denied GPOs with reason `Security Filtering`.
- The filter contained `GG-HelpDesk-Technicians`, but the GPO included computer settings and the workstation computer account was not authorized to apply it.

## Root cause

The security filter was designed only around the user group even though computer-side settings required the computer account to have Read and Apply Group Policy permissions.

## Resolution

Created `GG-HelpDesk-Workstations`, added `NS-HD-WS01$`, granted Read and Apply Group Policy to that group, retained Read permission for authenticated principals as required for processing, refreshed policy, and restarted the endpoint.

## Validation

`gpresult` showed the GPO as applied. RSAT availability and the intended local-group preference were validated. No unrelated workstation received the policy.

## Prevention

The design standard now requires separate documentation of user-side and computer-side filtering requirements before approval.
