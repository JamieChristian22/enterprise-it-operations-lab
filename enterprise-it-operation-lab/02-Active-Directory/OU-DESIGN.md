# Active Directory OU Design

```text
CTS-LAB.LOCAL
├── CTS-Users
│   ├── Executive
│   ├── IT
│   ├── Finance
│   ├── Human-Resources
│   ├── Operations
│   ├── Sales
│   ├── Marketing
│   └── Customer-Success
├── CTS-Computers
│   ├── Workstations
│   ├── Laptops
│   ├── Kiosks
│   └── Servers
├── CTS-Groups
│   ├── Security
│   └── Distribution
├── CTS-Service-Accounts
├── CTS-Disabled-Objects
└── CTS-Admins
```

The design separates users, devices, groups, privileged identities, service accounts, and disabled objects so policy and delegation can be applied safely.
