# Microsoft 365 Tenant Architecture

```mermaid
flowchart TB
    U[Employees and Contractors] --> E[Microsoft Entra ID]
    A[Microsoft 365 Administrators] --> E
    E --> CA[Conditional Access and MFA]
    E --> EX[Exchange Online]
    E --> T[Microsoft Teams]
    E --> SP[SharePoint Online]
    E --> OD[OneDrive for Business]
    EX --> SM[Shared Mailboxes]
    EX --> DG[Distribution Groups]
    T --> MG[Microsoft 365 Groups]
    SP --> SITES[Department Sites]
    A --> PS[Microsoft Graph and Exchange Online PowerShell]
    PS --> E
    PS --> EX
    PS --> T
    PS --> SP
    AUDIT[Microsoft Purview Audit] --> A
```

## Security Boundaries

- Individual administrator accounts are separate from daily-use accounts.
- Administrative roles are assigned by job requirement.
- MFA is required for all users and administrators.
- Legacy authentication is blocked.
- Guest access is reviewed regularly.
- Shared mailboxes do not use direct sign-in.
- Access is group-based wherever practical.
