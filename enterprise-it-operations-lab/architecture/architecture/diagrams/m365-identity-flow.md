# Microsoft 365 Identity Flow

```mermaid
flowchart LR
    AD[Active Directory] --> SYNC[Entra Connect / Cloud Sync]
    SYNC --> ENTRA[Microsoft Entra ID]
    ENTRA --> EXO[Exchange Online]
    ENTRA --> TEAMS[Microsoft Teams]
    ENTRA --> SPO[SharePoint Online]
    ENTRA --> OD[OneDrive]
    CA[Conditional Access] --> ENTRA
    MFA[MFA] --> ENTRA
```
