# Server Build Guide
1. Install Windows Server 2022.
2. Rename server and configure static IP/DNS.
3. Join `northstar.local`.
4. Install updates and monitoring.
5. Apply firewall, RDP, logging, and local-admin baseline.
6. Configure backup and run validation.

```powershell
Rename-Computer NSS-FILE01 -Restart
Add-Computer -DomainName northstar.local -Restart
Get-NetIPConfiguration
Test-ComputerSecureChannel
```
