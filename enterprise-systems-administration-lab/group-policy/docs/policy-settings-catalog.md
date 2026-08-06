# Policy Settings Catalog

## Domain account policy

| Setting | Value | Rationale |
|---|---:|---|
| Minimum password length | 14 characters | Raises resistance to guessing attacks |
| Password history | 24 passwords | Reduces password reuse |
| Maximum password age | 90 days | Lab policy aligned to scenario requirements |
| Minimum password age | 1 day | Prevents rapid password cycling |
| Account lockout threshold | 10 attempts | Limits brute-force attempts while reducing accidental lockouts |
| Lockout duration | 15 minutes | Supports self-recovery after temporary lockout |
| Reset lockout counter | 15 minutes | Matches lockout duration |

## Workstation security baseline

- Microsoft Defender Antivirus enabled.
- Real-time protection enabled.
- Windows Firewall enabled for Domain, Private, and Public profiles.
- UAC Admin Approval Mode enabled.
- Anonymous SID/name translation disabled.
- Guest account disabled.
- SMBv1 disabled through Windows feature management and configuration control.
- Removable storage write access denied for the standard endpoint baseline.
- Local administrator membership managed through approved Group Policy Preferences with item-level targeting.

## Audit and logging

- Audit account logon, account management, logon/logoff, policy change, privilege use, process creation, and system events.
- Include command line in process creation events.
- Enable PowerShell script block logging, module logging, and transcription to an access-controlled share.
- Increase Security and PowerShell operational log sizes based on endpoint storage capacity.

## Windows Update

- Automatic download and scheduled installation.
- Maintenance window: Wednesday at 03:00 local time.
- No automatic restart while a user is logged on during active hours.
- Quality update deferral: 7 days for standard endpoints.
- Feature update deferral: 30 days for standard endpoints.

## User session security

- Password-protected screen saver enabled.
- Screen saver timeout: 900 seconds.
- Prevent changing the screen saver for kiosk users only.

## Kiosk lockdown

- User Group Policy loopback processing: Replace.
- Control Panel and Settings access prohibited.
- Command Prompt and registry tools disabled.
- Only approved applications available through the kiosk operating model.
