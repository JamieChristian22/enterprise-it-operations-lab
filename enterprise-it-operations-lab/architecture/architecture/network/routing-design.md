# Routing Design

## On-Premises

- Core Layer 3 switching provides inter-VLAN routing.
- Firewall policies govern routed access between security zones.
- Default route points to the enterprise firewall.
- Distribution sites use route-based IPsec VPNs.
- Management routes are restricted and not advertised to guest networks.

## AWS

- Public subnets route to the Internet Gateway.
- Private application subnets route outbound through NAT Gateways.
- Database subnets have no direct internet route.
- Hybrid routes use the VPN attachment.
- Route tables are separated by subnet function.
