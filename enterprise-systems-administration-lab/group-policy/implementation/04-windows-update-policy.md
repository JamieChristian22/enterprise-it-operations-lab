# Windows Update Policy Implementation

Create `CORP-WS-Windows-Update-v1.0` and pilot it separately from the security baseline so servicing changes can be rolled back independently.

## Configuration

- Configure Automatic Updates: Enabled, option 4.
- Scheduled installation: Wednesday, 03:00.
- No auto-restart with logged-on users: Enabled.
- Active hours: 07:00–19:00.
- Quality update deferral: 7 days.
- Feature update deferral: 30 days.

## Validation

Review:

```powershell
Get-ItemProperty 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -ErrorAction SilentlyContinue
Get-WinEvent -LogName 'Microsoft-Windows-WindowsUpdateClient/Operational' -MaxEvents 30
```
