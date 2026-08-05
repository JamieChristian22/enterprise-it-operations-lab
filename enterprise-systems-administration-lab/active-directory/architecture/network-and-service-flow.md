# Network and Authentication Flow

```mermaid
flowchart LR
  U[User on JC-WS01] -->|DNS query| D1[JC-DC01 DNS]
  U -->|Kerberos/LDAP| D1
  U -->|Failover authentication| D2[JC-DC02 AD DS/DNS]
  D1 <-->|AD/DNS/SYSVOL replication| D2
  U -->|Group-based access| FS[File Services]
  ADM[Named Admin Account] -->|RSAT / PowerShell| D1
  ADM -->|Health validation| D2
```

## Subnets
- Server subnet: `10.20.0.0/24`
- Client subnet: `10.20.10.0/24`
- Default gateway: `.1` in each subnet
- NTP authority: PDC Emulator synchronizes with an external approved source; domain members follow the domain hierarchy.
