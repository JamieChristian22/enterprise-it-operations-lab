# Privileged Account Standard

## Naming
- Tier 0: `adm0-<username>`
- Tier 1: `adm1-<username>`
- Tier 2: `adm2-<username>`
- Service account: `svc-<application>-<function>`
- Emergency access: `bg-entra-01`, `bg-entra-02`

## Security Controls
- Minimum 20-character unique password or managed credential
- MFA required where technically supported
- No mailbox, Teams, OneDrive, or general browsing license
- Account marked sensitive and not delegable when appropriate
- Interactive logon prohibited for service accounts
- Owner, purpose, tier, creation ticket, and review date recorded
- Temporary elevation expires automatically

## Lifecycle
Provision from an approved request, test scoped access, review every 90 days, disable immediately at separation or role change, and retain audit evidence according to policy.
