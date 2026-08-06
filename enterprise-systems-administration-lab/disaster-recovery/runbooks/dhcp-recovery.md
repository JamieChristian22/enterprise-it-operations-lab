# DHCP Recovery Runbook

1. Provision the recovery DHCP server.
2. Import the latest DHCP configuration export.
3. Authorize the server in Active Directory.
4. Confirm scope options, exclusions, reservations, and failover settings.
5. Activate scopes in recovery VLANs.
6. Release and renew a test client lease.
7. Validate DNS registration and default gateway assignment.
8. Record lease utilization and recovery completion time.
