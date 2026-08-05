# Alert Catalog

| Alert | Threshold | Severity | Response |
|---|---|---|---|
| Endpoint offline | >24 hours | Low | Confirm user status and device ownership |
| Disk capacity | Free space <10% for 15 minutes | High | Reclaim space and review growth |
| Defender detection | High/severe malware | Critical | Isolate, investigate, and scan |
| BitLocker suspended | >15 minutes | High | Resume protection and verify escrow |
| Intune noncompliance | >4 hours | Medium | Identify failed control and remediate |
| VPN failure rate | >20% over 10 minutes | High | Review auth, certificates, gateway, DNS |
| Identity lockouts | >10 in 5 minutes | High | Identify source and stale credentials |
| Microsoft 365 disruption | Service incident or correlated failures | High | Validate service health and workaround |
| Print backlog | >40 jobs or oldest >15 minutes | Medium | Clear queue and validate print service |
| File share unavailable | Two failed synthetic checks | Critical | Validate server, DNS, network, and storage |
| Backup job failed | Scheduled job failure | High | Restore backup authentication and rerun |
