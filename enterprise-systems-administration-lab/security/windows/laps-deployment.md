# Windows LAPS Deployment

## Objectives

- Unique local administrator password per device
- Automatic rotation
- Password stored in Active Directory or Entra ID
- Retrieval limited to approved support groups
- Audit password retrieval
- Disable shared local administrator passwords

## Validation

```powershell
Get-LapsADPassword -Identity NSS-WIN-CLIENT01
Get-LapsDiagnostics
```

## Access Model

- Help Desk: Read approved workstation passwords
- Server Administrators: Read approved server passwords
- Domain Admins: Emergency-only broad access
