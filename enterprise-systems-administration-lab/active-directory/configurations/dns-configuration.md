# DNS Configuration

- Forward lookup zone: `corp.jamiechristian.lab`
- Zone type: Active Directory-integrated
- Dynamic updates: Secure only
- DNS servers: `10.20.0.10`, `10.20.0.11`
- Client DNS: domain controllers only
- Aging/scavenging lab setting: 7-day no-refresh + 7-day refresh
- Forwarders: approved upstream resolvers configured on DNS servers, never directly on domain clients

Validation includes SOA/NS checks, `_ldap._tcp.dc._msdcs` SRV resolution, forward and reverse lookup, dynamic registration, and cross-DC consistency.
