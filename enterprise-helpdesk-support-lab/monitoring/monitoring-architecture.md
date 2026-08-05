# Monitoring Architecture

```mermaid
flowchart LR
    A[Endpoints] --> E[Monitoring and Event Collection]
    B[Active Directory] --> E
    C[Microsoft 365] --> E
    D[Network and VPN] --> E
    F[Cloud and Backup] --> E
    G[Security Tools] --> E
    E --> H[Correlation and Threshold Rules]
    H --> I[Alert Queue]
    I --> J[Service Desk Triage]
    J --> K{Service Impact?}
    K -->|Yes| L[Incident Management]
    K -->|No| M[Standard Alert Response]
    L --> N[Technical Teams]
    M --> N
    N --> O[Validation and Closure]
    O --> P[Metrics and Continual Improvement]
```

## Coverage

- Endpoint availability, disk, encryption, and compliance
- Defender and security detections
- Active Directory lockouts and identity risk
- VPN authentication and DNS
- Microsoft 365 service health
- File share synthetic checks
- Print queue backlog
- Cloud backup failures
