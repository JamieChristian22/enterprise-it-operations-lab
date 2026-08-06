# Site Failover and Failback Runbook

## Failover
- Activate recovery routing and VPN.
- Publish recovery DNS records.
- Restore services by tier.
- Validate business access.

## Failback
- Confirm primary site stability for 24 hours.
- Replicate changed data back to primary storage.
- Schedule approved maintenance window.
- Freeze writes, complete final synchronization, and validate checksums.
- Restore primary DNS/routing.
- Monitor for two hours before closing the change.
