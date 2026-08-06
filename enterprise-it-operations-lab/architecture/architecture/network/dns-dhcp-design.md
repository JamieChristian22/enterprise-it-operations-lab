# DNS and DHCP Design

## DNS

- AD-integrated DNS zones.
- Two DNS servers at headquarters.
- Branch domain controllers provide local resolution.
- Conditional forwarding for AWS private zones where required.
- Public DNS separated from internal DNS.

## DHCP

- DHCP failover at headquarters.
- Separate scopes per VLAN.
- Routers use DHCP relay.
- Reservations for infrastructure devices.
- Options include DNS servers, domain name, gateway, and NTP where applicable.
