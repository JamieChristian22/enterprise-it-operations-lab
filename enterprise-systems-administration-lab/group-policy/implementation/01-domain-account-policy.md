# Domain Account Policy Implementation

## Change target

Link `CORP-DOM-Account-Policy-v1.0` to the domain root.

## Procedure

1. Open Group Policy Management on `NS-MGMT01`.
2. Create `CORP-DOM-Account-Policy-v1.0`.
3. Edit Computer Configuration → Policies → Windows Settings → Security Settings → Account Policies.
4. Configure the password, lockout, and Kerberos values approved in the settings catalog.
5. Link the GPO at `corp.northstar.local`.
6. Verify that no conflicting account policy is expected from a lower OU; domain account policy is evaluated from the domain level for domain accounts.
7. Back up the GPO and export an HTML report.

## Validation

```powershell
Get-ADDefaultDomainPasswordPolicy | Format-List
net accounts /domain
```

Use a designated test account to verify the lockout threshold. Do not test with an administrator account.
