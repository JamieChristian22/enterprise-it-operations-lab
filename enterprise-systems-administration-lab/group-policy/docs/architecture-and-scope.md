# Architecture and Scope

## Policy flow

```text
Domain account policy
        │
        ▼
CORP OU baseline policies
        │
        ├── Workstations/Standard ── security + audit + update
        ├── Workstations/HelpDesk ── baseline + Help Desk controls
        ├── Workstations/Kiosks ──── baseline + loopback lockdown
        └── Workstations/Pilot ───── production candidates first
```

## Administrative model

| Role | Responsibility |
|---|---|
| Infrastructure Administrator | Creates, links, backs up, and restores GPOs |
| Security Administrator | Approves security baseline and audit configuration |
| Help Desk Lead | Validates user impact and support procedures |
| Change Manager | Approves production rollout and rollback window |
| Service Desk | Records incidents and attaches `gpresult` evidence |

## Delegation model

- `GG-Tier0-Domain-Admins`: full control over all domain GPOs.
- `GG-GPO-Editors`: edit settings but cannot independently approve production links.
- `GG-GPO-Readers`: read and generate reports.
- `GG-HelpDesk-Technicians`: no general GPO edit rights; may collect client-side evidence.

## Scope rules

- Account policy: domain root only.
- Workstation controls: `OU=Workstations,OU=CORP,DC=corp,DC=northstar,DC=local`.
- User session controls: `OU=Users,OU=CORP,...`.
- Kiosk loopback: Kiosk computer OU only.
- Pilot changes: Pilot OUs and `GG-GPO-Pilot-Users`/`GG-GPO-Pilot-Computers`.
