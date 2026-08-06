# Network Segmentation

```mermaid
flowchart LR
    FW[Firewall] --> USER[User VLAN]
    FW --> SERVER[Server VLAN]
    FW --> MGMT[Management VLAN]
    FW --> PRN[Printer VLAN]
    FW --> VOICE[Voice VLAN]
    FW --> GUEST[Guest VLAN]

    USER -->|Approved app flows| SERVER
    MGMT -->|RDP SSH WinRM HTTPS| SERVER
    GUEST -->|Internet only| INTERNET[Internet]
    PRN -->|Print protocols only| SERVER
    VOICE -->|Voice services only| UC[Unified Communications]
```

## Segmentation Rules

- Management traffic originates only from the management VLAN.
- Guest access cannot reach internal networks.
- Printer VLAN access is restricted to print services.
- User VLANs cannot directly administer servers.
- East-west traffic is explicitly allowed, not assumed.
