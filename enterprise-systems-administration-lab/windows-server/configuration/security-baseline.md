# Windows Server Security Baseline

## Required Controls

| ID | Control | Required state | Validation |
|---|---|---|---|
| WS-01 | Windows Firewall | Domain, Private, and Public profiles enabled | `Get-NetFirewallProfile` |
| WS-02 | RDP Network Level Authentication | Enabled | `UserAuthentication = 1` |
| WS-03 | RDP scope | Management subnet only | Firewall remote address check |
| WS-04 | SMBv1 | Removed/disabled | `Get-WindowsOptionalFeature SMB1Protocol` |
| WS-05 | Guest account | Disabled | `Get-LocalUser Guest` |
| WS-06 | Local administrators | Approved identities only | `Get-LocalGroupMember Administrators` |
| WS-07 | Audit policy | Logon, account management, policy change, object access enabled | `auditpol /get /category:*` |
| WS-08 | PowerShell logging | Module and script-block logging enabled | Registry/GPO validation |
| WS-09 | Defender | Real-time protection enabled | `Get-MpComputerStatus` |
| WS-10 | Time synchronization | Domain hierarchy | `w32tm /query /status` |
| WS-11 | Automatic updates | Approved maintenance policy | Windows Update policy report |
| WS-12 | TLS | TLS 1.2 enabled; obsolete protocols disabled where compatible | Registry validation |
| WS-13 | Password policy | 14 characters, complexity, lockout after 10 attempts | Domain policy report |
| WS-14 | Backup | Latest successful recovery point < 26 hours | Backup freshness script |
| WS-15 | Free space | Critical volumes maintain >= 20% free | Health script |

## Exceptions

No baseline exceptions remain open. Any future exception requires an owner, business justification, compensating control, expiration date, and approval.
