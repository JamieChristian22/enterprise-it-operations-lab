# Backup Risk Register

| ID | Risk | Likelihood | Impact | Control | Residual rating | Owner |
|---|---|---|---|---|---|---|
| BR-01 | Compromised admin deletes recovery points | Low | Critical | Vault lock, soft delete, MFA, separated roles | Low | Security Engineering |
| BR-02 | Encryption key becomes unavailable | Low | Critical | Key rotation, deletion protection, cross-region key ownership | Low | Security Engineering |
| BR-03 | Backups succeed but are unusable | Medium | Critical | Scheduled restore tests and integrity checks | Low | Cloud Operations |
| BR-04 | New resource lacks backup assignment | Medium | High | Inventory reconciliation and tag-based controls | Medium | Cloud Platform |
| BR-05 | Cross-region copy exceeds RPO | Low | High | Job alerts, monthly reporting, regional exercises | Low | Cloud Operations |
| BR-06 | Ransomware contaminates recent copies | Medium | Critical | Immutable retention and pre-compromise recovery analysis | Medium | Security Operations |
