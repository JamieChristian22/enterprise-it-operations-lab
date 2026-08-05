# Organizational Unit Design

```text
corp.northstar.local
└── Northstar
    ├── Admin
    │   ├── Privileged Users
    │   └── Service Accounts
    ├── Groups
    │   ├── Global Role Groups
    │   ├── Resource Groups
    │   └── Policy Groups
    ├── Servers
    │   ├── Domain Controllers
    │   ├── File Servers
    │   └── Member Servers
    ├── Workstations
    │   ├── Pilot
    │   ├── Headquarters
    │   └── Regional Office
    ├── Users
    │   ├── Finance
    │   ├── Human Resources
    │   ├── Information Technology
    │   ├── Operations
    │   └── Sales
    └── Disabled Objects
        ├── Disabled Users
        └── Disabled Computers
```

## Design Rationale

- Department OUs allow targeted administration and policy scope.
- Privileged users and service accounts are separated from standard identities.
- Disabled objects are retained outside active-user policy scope.
- Groups are separated by purpose to reduce permission mistakes.
- Pilot workstations allow controlled GPO testing.
