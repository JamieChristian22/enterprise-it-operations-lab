# Microsoft Defender Configuration

## Required Settings

- Real-time protection enabled
- Cloud-delivered protection enabled
- Behavior monitoring enabled
- Script scanning enabled
- Archive scanning enabled
- Potentially unwanted application protection enabled
- Security intelligence updates current
- Exclusions minimized and documented

## Validation

```powershell
Get-MpComputerStatus
Get-MpPreference
Update-MpSignature
```

## Operational Standard

Any Defender exclusion requires an owner, justification, affected path or process, expiration date, and documented compensating control.
