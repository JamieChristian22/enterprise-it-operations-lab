# Requirements-to-Evidence Matrix

| Requirement | Implementation | Evidence |
|---|---|---|
| Centralized identity and DNS | AD DS and DNS on NSS-DC01 | `evidence/server-build-validation.txt` |
| Standard server builds | Inventory, naming, static addressing, role matrix | `configuration/server-inventory.csv` |
| Department file services | Four SMB shares with group-based access | `evidence/file-services-validation.txt` |
| Least-privilege permissions | RW/RO security groups mapped to NTFS ACLs | `configuration/share-permission-matrix.csv` |
| Secure remote administration | NLA and management-subnet firewall scope | `evidence/security-baseline-validation.txt` |
| Host security | Firewall, Defender, SMBv1 removal, audit controls | `configuration/security-baseline.md` |
| Backup and recovery | Nightly backup and alternate-location restore | `evidence/backup-and-restore-validation.txt` |
| Monitoring and reporting | Health, event, service, disk, and backup scripts | `reports/monthly-operations-report.md` |
| Change governance | Approved patch and share deployment changes | `changes/` |
| Incident response | Documented backup, RDP, and disk incidents | `incidents/` |
| Automated validation | Pester tests and baseline script | `tests/`, `powershell/` |
