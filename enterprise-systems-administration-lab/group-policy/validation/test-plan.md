# Group Policy Test Plan

| ID | Test | Method | Expected result | Status |
|---|---|---|---|---|
| GP-001 | Pilot computer receives workstation baseline | `gpresult /h` | Baseline listed as applied | Passed |
| GP-002 | Firewall enabled on all profiles | `Get-NetFirewallProfile` | Domain, Private, Public enabled | Passed |
| GP-003 | Defender real-time protection enabled | `Get-MpComputerStatus` | `True` | Passed |
| GP-004 | Screen locks after inactivity | Interactive test | Locks within 15 minutes | Passed |
| GP-005 | PowerShell script-block events recorded | Run signed test script; review event 4104 | Event recorded | Passed |
| GP-006 | Audit process creation enabled | `auditpol /get` | Success auditing enabled | Passed |
| GP-007 | Update policy present | Registry and event log review | Approved schedule and deferrals present | Passed |
| GP-008 | Help Desk filter excludes standard users | `gpresult` under standard account | Help Desk GPO denied/not applied | Passed |
| GP-009 | Kiosk loopback Replace works | Sign in to kiosk as test user | Kiosk restrictions applied | Passed |
| GP-010 | Rollback removes pilot restriction | Unlink and refresh | Setting no longer enforced | Passed |
