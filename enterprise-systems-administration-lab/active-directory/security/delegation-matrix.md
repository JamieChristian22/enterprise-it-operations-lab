# Delegation Matrix

| Role | Scope | Allowed | Explicitly Not Allowed |
|---|---|---|---|
| Help Desk | Department user OUs | Reset password, unlock, require password change, read attributes | Delete users, edit groups, privileged OUs, GPOs |
| Desktop Support | Workstation OUs | Create/reset computer objects, move within workstation OUs | Servers, DCs, user administration |
| Systems Administrator | Domain operational scope | AD/DNS/GPO administration under change control | Unreviewed Tier-0 membership changes |
| Domain Admin | Emergency/Tier-0 | Forest/domain-level administration | Daily browsing, email, routine support |

Delegation is group-based, documented, and tested using both positive and negative permission cases.
