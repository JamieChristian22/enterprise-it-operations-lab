# Group Policy Validation

| GPO | Scope | Validation Method | Result |
|---|---|---|---|
| GPO-Domain-Password-Policy | Domain | `Get-ADDefaultDomainPasswordPolicy` | PASS |
| GPO-Workstation-Security-Baseline | Workstations OU | `gpresult /h` on CL01 | PASS |
| GPO-Drive-Mappings | Corporate OU | User sign-in validation | PASS |
| GPO-HelpDesk-Delegation | Corporate OU | RSAT and privilege test | PASS |
| GPO-Audit-Policy | Domain Controllers OU | `auditpol /get /category:*` | PASS |
| GPO-Windows-Update | Workstations OU | Registry and policy result | PASS |

## Observed Behavior
- Department drive mappings were applied according to security-group membership.
- Screen lock and Defender settings were enforced on CL01.
- Audit policy subcategories were enabled on DC01.
- No denied or unexpected GPOs appeared in the applied policy report.
