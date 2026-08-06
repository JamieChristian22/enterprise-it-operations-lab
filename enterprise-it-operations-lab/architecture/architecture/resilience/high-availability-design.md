# High Availability Design

## Identity

- Multiple domain controllers.
- AD-integrated DNS replication.
- DHCP failover.

## AWS

- Multi-AZ application and database subnets.
- Redundant NAT Gateways.
- Application Load Balancer.

## Monitoring

- Persistent storage for metrics.
- Configuration backups.
- Alert delivery through multiple channels.

## Backup

- Local repository.
- Offsite copy.
- Immutable copy.
- Scheduled restore testing.
