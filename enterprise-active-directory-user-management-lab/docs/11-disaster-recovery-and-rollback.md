# Disaster Recovery and Rollback Plan

## Protected Components
System State for DC01, GPO backups, exported OU/group configuration, file-share ACL exports, script versions, and audit reports.

## Recovery Objectives
- Identity administration outage: restore service within four hours.
- Accidental user or OU deletion: recover within one hour after approval.
- Incorrect GPO deployment: roll back within thirty minutes.

## Backup Procedure
1. Take a Windows Server Backup System State backup of DC01.
2. Run `Backup-GPO -All` to the secured backup path.
3. Export users, groups, memberships, OUs, and ACLs using the audit scripts.
4. Hash the exported files and record the backup in the change log.

## Rollback Examples
- **Bad group change:** restore membership from the prechange CSV.
- **Bad GPO:** unlink the new GPO, restore the prior backup, run `gpupdate /force`, and validate with `gpresult /h`.
- **Accidental deletion:** use AD Recycle Bin when enabled; otherwise perform an authoritative restore under the recovery runbook.
- **Incorrect ACL:** apply the approved ACL export and verify effective access.

## Test Schedule
Quarterly tabletop review and semiannual restore test in an isolated lab network. Results are retained in `evidence/reports/`.
