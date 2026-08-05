# OU and Delegation Model

```text
corp.jamiechristian.lab
├── Tier-0
│   ├── Domain Controllers
│   ├── Privileged Accounts
│   └── Service Accounts
├── Users
│   ├── Finance
│   ├── Human Resources
│   ├── Information Technology
│   ├── Operations
│   ├── Sales
│   └── Disabled Users
├── Workstations
│   ├── Finance
│   ├── Human Resources
│   ├── Information Technology
│   ├── Operations
│   ├── Sales
│   └── Quarantine
├── Servers
└── Groups
```

## Delegation
Help Desk receives reset-password, unlock-account, and force-password-change permissions on departmental user OUs. It cannot create/delete users, modify privileged groups, manage Tier-0 objects, or edit GPOs. Desktop Support can join/reset workstation computer objects in `Workstations` but has no server or domain-controller permissions.
