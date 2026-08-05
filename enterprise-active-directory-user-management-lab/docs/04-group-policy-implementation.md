# Group Policy Implementation

## Policy Set

### 1. Default Domain Password and Lockout Policy

Configure at domain level:

- Minimum password length: 14 characters
- Password history: 24
- Maximum age: 90 days for standard lab users
- Minimum age: 1 day
- Complexity: enabled
- Reversible encryption: disabled
- Account lockout threshold: 10 invalid attempts
- Lockout duration: 15 minutes
- Reset counter: 15 minutes

> In a modern production environment, password-expiration choices should follow organizational policy and current identity guidance. This lab uses a traditional enterprise baseline to demonstrate administration.

### 2. Workstation Security Baseline

Link to Workstations OU:

- Screen lock after 15 minutes
- Password required on resume
- Windows Defender enabled
- Firewall enabled for all profiles
- Guest account disabled
- Audit process creation enabled
- PowerShell script block logging enabled

### 3. Department Drive Mapping

Use Group Policy Preferences:

| Department | Drive | Path | Item-Level Targeting |
|---|---|---|---|
| HR | H: | `\\FS01\HR$` | `GG-HR-General` |
| Finance | F: | `\\FS01\Finance$` | `GG-FIN-General` |
| Operations | O: | `\\FS01\Operations$` | `GG-OPS-General` |
| Sales | S: | `\\FS01\Sales$` | `GG-SALES-General` |
| IT | I: | `\\FS01\IT$` | `GG-IT-General` |

Action: Update. Remove this item when no longer applied: enabled.

### 4. Removable Storage Restriction

Link to Workstations OU and security-filter to `GPO-USB-Blocked`:

- All Removable Storage classes: Deny all access = Enabled

### 5. Help Desk Workstation Policy

Link to IT Workstations OU:

- RSAT allowed
- PowerShell transcription enabled
- Event Viewer remote management enabled
- WinRM allowed only from the admin subnet

## Change Procedure

1. Back up the current GPO.
2. Create a change record.
3. Test in `OU=Pilot,OU=Workstations`.
4. Run `gpupdate /force` on CL01.
5. Validate with `gpresult /h C:\Temp\gpresult.html`.
6. Confirm no unexpected settings.
7. Expand scope after approval.

## Rollback

- Unlink or disable the new GPO.
- Restore from the pre-change GPO backup.
- Run Group Policy update.
- Validate with `gpresult`.
- Record rollback reason and outcome.
