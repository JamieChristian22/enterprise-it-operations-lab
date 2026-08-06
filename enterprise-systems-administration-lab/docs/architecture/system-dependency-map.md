# System Dependency Map

| Service | Depends On | Downstream Impact if Unavailable |
|---|---|---|
| Active Directory | DNS, domain controllers, network | Authentication, GPO, service accounts, administration |
| DNS | Domain controllers, network | AD, applications, file access, monitoring |
| File Services | AD, DNS, storage, backup | Department data and shared workflows |
| IIS Applications | AD, DNS, certificates, application files | Internal applications and service portals |
| Monitoring | DNS, network, credentials, managed nodes | Reduced detection and reporting capability |
| Backup | AD, DNS, storage repositories, protected agents | Loss of recovery readiness and RPO compliance |
| Configuration Management | Management node, WinRM/SSH, credentials | Configuration drift and inconsistent servers |
| Microsoft 365 | Internet, Entra identity, user licensing | Email and collaboration interruption |

## Recovery Order

1. Network and core management access
2. Active Directory and DNS
3. Backup control and storage validation
4. File and application dependencies
5. Monitoring and configuration management
6. Remaining business services
