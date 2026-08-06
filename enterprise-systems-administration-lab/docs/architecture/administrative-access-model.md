# Administrative Access Model

## Account Separation

Each administrator uses a standard account for email and routine work and a separate privileged account for administrative tasks.

## Role Groups

- `ROLE_HelpDesk_Level1` — Password resets and account unlocks
- `ROLE_HelpDesk_Level2` — User and group lifecycle support
- `ROLE_Server_Admins` — Member server administration
- `ROLE_AD_Admins` — Domain service administration
- `ROLE_Backup_Admins` — Backup platform and restore operations
- `ROLE_Change_Approvers` — Change review and approval

## Controls

- No shared administrator accounts
- Privileged actions require traceable identities
- Service accounts are noninteractive
- Delegation is scoped to specific OUs or systems
- High-risk access is reviewed quarterly
- Emergency access is logged and reviewed after use
