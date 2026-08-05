# Backup and Recovery Risk Register

| ID | Risk | Likelihood | Impact | Control | Residual Risk |
|---|---|---|---|---|---|
| BR-01 | Ransomware deletes online backups | Medium | Critical | Offline copy, cloud soft delete, separate credentials | Low |
| BR-02 | Backup completes but is corrupt | Low | Critical | Checksums and scheduled restore testing | Low |
| BR-03 | Repository capacity exhausted | Medium | High | Threshold alerts and monthly forecasting | Low |
| BR-04 | Service-account compromise | Low | Critical | Non-interactive account, least privilege, credential rotation | Low |
| BR-05 | DR documentation becomes stale | Medium | High | Quarterly exercise and owner review | Low |
| BR-06 | Offsite connectivity outage | Medium | Medium | Local and offline copies; retry and escalation | Low |
