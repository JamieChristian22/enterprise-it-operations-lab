# Asset Lifecycle

```mermaid
flowchart LR
    A[Request] --> B[Approval]
    B --> C[Procurement]
    C --> D[Receiving and Tagging]
    D --> E[Security Configuration]
    E --> F[Assignment]
    F --> G[Support and Maintenance]
    G --> H[Periodic Audit]
    H --> I{Continue Service?}
    I -->|Yes| G
    I -->|Repair| J[Repair]
    J --> G
    I -->|Retire| K[Return and Data Wipe]
    K --> L[Certified Disposal]
    L --> M[Record Closure]
```

## Lifecycle Controls

- Request and approval
- Purchase and receiving verification
- Asset tagging
- Baseline configuration
- Encryption and security validation
- Assignment documentation
- Maintenance and warranty tracking
- Quarterly physical audit
- Return and reassignment
- Data sanitization
- Certified recycling
- Financial and inventory closure
