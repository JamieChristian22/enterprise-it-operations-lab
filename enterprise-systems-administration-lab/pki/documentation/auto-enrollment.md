# Certificate Auto-Enrollment

## Group Policy Path

`Computer Configuration > Policies > Windows Settings > Security Settings > Public Key Policies`

Enable:

- Certificate Services Client – Auto-Enrollment
- Renew expired certificates
- Update certificates using certificate templates
- Enroll certificates automatically

Repeat under User Configuration when user certificate auto-enrollment is required.

## Validation

```powershell
gpupdate /force
certutil -pulse
Get-ChildItem Cert:\LocalMachine\My
Get-ChildItem Cert:\CurrentUser\My
```
