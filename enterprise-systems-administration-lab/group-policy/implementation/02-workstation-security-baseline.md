# Workstation Security Baseline Implementation

## Scope

`OU=Workstations,OU=CORP,DC=corp,DC=northstar,DC=local`

## Procedure

1. Create `CORP-WS-Security-Baseline-v1.0`.
2. Disable User Configuration settings because the GPO contains only computer controls.
3. Configure Defender, firewall, UAC, account, SMB, and removable-storage controls from the settings catalog.
4. Link to the Pilot workstation OU first.
5. Run `gpupdate /force` and restart when required.
6. Execute the automated validation script.
7. Review application compatibility and Help Desk tickets for 48 hours in the lab change window.
8. Link to the parent Workstations OU after approval.

## Acceptance criteria

- All three firewall profiles report enabled.
- Defender real-time protection reports enabled.
- The GPO appears under Applied Group Policy Objects.
- No critical startup, sign-in, networking, or line-of-business application regression occurs.
