# License Management

## License Assignment Model

| Profile | License |
|---|---|
| Standard employee | Microsoft 365 Business Premium |
| Frontline employee | Microsoft 365 F3 when approved |
| Contractor | Minimum approved license |
| Shared mailbox | No license unless size, archive, or advanced feature requires one |

## Controls

- Assign licenses through groups when practical.
- Set usage location before license assignment.
- Monitor available and consumed units.
- Remove licenses only after mailbox and OneDrive preservation.
- Document exceptions.
- Review disabled accounts that still consume licenses.

## Useful Commands

```powershell
Get-MgSubscribedSku |
    Select-Object SkuPartNumber, ConsumedUnits,
        @{Name="EnabledUnits";Expression={$_.PrepaidUnits.Enabled}}

Get-MgUser -Filter "accountEnabled eq false" -All |
    ForEach-Object {
        Get-MgUserLicenseDetail -UserId $_.Id
    }
```
