# AWS Connectivity

## Primary Design

- Route-based site-to-site VPN.
- Dual tunnels for resilience.
- Dynamic routing preferred where supported.
- On-premises networks advertise approved internal prefixes.
- AWS advertises only required private VPC prefixes.

## Administrative Access

- AWS Systems Manager preferred over inbound SSH or RDP.
- No public IPs on application or database instances.
- Session activity logged.
