# SMB and Legacy Protocol Hardening

## Controls

- Disable SMBv1
- Require SMB signing for servers
- Disable anonymous enumeration
- Disable insecure guest logons
- Remove NTLMv1 where compatibility allows
- Review legacy TLS and cipher requirements

## Validation

```powershell
Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
Get-SmbServerConfiguration
Get-SmbClientConfiguration
```
