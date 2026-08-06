# GPO Troubleshooting Guide

## Triage sequence

1. Confirm the user and computer are in the expected OUs.
2. Confirm the GPO link is enabled and the GPO section is not disabled.
3. Run `gpresult /h C:\Temp\gpresult.html /f`.
4. Review denied GPOs and denial reasons.
5. Check security filtering and delegation permissions.
6. Check WMI filter results.
7. Review inheritance, link order, Enforced, and Block Inheritance.
8. Confirm DNS points only to Active Directory-integrated DNS servers.
9. Verify SYSVOL and domain-controller connectivity.
10. Review `Microsoft-Windows-GroupPolicy/Operational` events.

## Common symptoms

| Symptom | Likely cause | Corrective action |
|---|---|---|
| GPO absent from applied and denied lists | Wrong OU or no link | Correct object placement or link target |
| Denied: Security Filtering | Missing Read/Apply permission | Correct ACL and group membership |
| Denied: WMI Filter | Filter returns false or times out | Test query and simplify filter |
| User setting ignored on kiosk | Loopback missing or wrong mode | Configure and verify Merge/Replace |
| Preference drive mapping fails | Item-level targeting, credentials, or network path | Validate targeting and share access |
| Policy applies inconsistently | Replication or SYSVOL issue | Check AD replication and DFSR events |
| Slow sign-in | Heavy scripts, WMI filters, or synchronous processing | Remove expensive processing and measure |

## Useful commands

```powershell
gpupdate /force
gpresult /r
gpresult /h C:\Temp\gpresult.html /f
Get-GPInheritance -Target 'OU=Workstations,OU=CORP,DC=corp,DC=northstar,DC=local'
Get-GPOReport -All -ReportType Html -Path C:\Temp\all-gpos.html
repadmin /replsummary
dcdiag /test:dns
```
