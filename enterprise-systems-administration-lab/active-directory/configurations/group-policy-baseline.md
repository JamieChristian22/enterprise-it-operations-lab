# Group Policy Baseline

| GPO | Link | Key Settings | Validation |
|---|---|---|---|
| JC-Domain-Password-Lockout | Domain | 14-character minimum; history 24; lockout threshold 10; 15-minute duration/reset | `Get-ADDefaultDomainPasswordPolicy` |
| JC-Workstation-Security | Workstations | Defender enabled; firewall on; SMBv1 disabled; guest disabled; screen lock 15 minutes | `gpresult`, registry, services |
| JC-Audit-Baseline | Domain Controllers, Servers, Workstations | Logon, account management, policy change, directory service access | `auditpol /get /category:*` |
| JC-Local-Admin-Control | Workstations | Approved support group assigned; unauthorized members removed | Local group audit |
| JC-Drive-Mapping | Department user OUs | Maps approved departmental shares using group targeting | User sign-in test |
| JC-Quarantine-Restriction | Quarantine | Restrictive firewall and denied business share access | Connectivity test |

Every GPO has an owner, version note, test result, and rollback instruction. Changes are first linked to a test OU before production-scope linking.
