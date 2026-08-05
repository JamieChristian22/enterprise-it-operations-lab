# Control-to-Evidence Matrix

| Control | Implementation | Verification Artifact | Acceptance Test |
|---|---|---|---|
| Identity provisioning | Onboarding script and runbook | AD user inventory; onboarding transcript | TC-001 |
| Duplicate prevention | Username validation | Automation validation report | TC-002 |
| Password reset control | Delegated reset workflow | Reset transcript; audit events | TC-003 |
| Account unlock control | Event review and delegated unlock | Unlock transcript; event 4767 | TC-004 |
| Department transfer | OU and group update workflow | Lifecycle validation | TC-005 |
| Termination control | Disable, remove access, retention OU | Offboarding transcript | TC-006 |
| Role-based access | AGDLP | Group map and NTFS export | TC-007 |
| Access denial | Department isolation | NTFS review | TC-008 |
| Least privilege | Help Desk delegation | Delegation export | TC-009/TC-010 |
| Workstation baseline | GPO | GPO report and gpresult | TC-011 |
| GPO rollback | Link disable and backup restore | RFC-AD-003 | TC-012 |
| GPO recovery | Backup-GPO | Backup runbook and report | TC-013 |
| DNS operation | AD-integrated DNS | DNS collector output | TC-014 |
| Domain health | DCDiag and Repadmin | Domain health outputs | TC-015 |
