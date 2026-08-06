# Naming Conventions

## Servers

Format: `<ROLE><NUMBER>`

Examples:

- `DC01`, `DC02` — Domain controllers
- `FS01` — File server
- `IIS01` — Web server
- `MON01` — Monitoring server
- `BAK01` — Backup server
- `MGMT01` — Management server
- `LNX01` — Linux administration node

## Groups

- `GG_` — Global group
- `DL_` — Domain local group
- `SG_` — Security group
- `ROLE_` — Administrative role group

Examples:

- `GG_Finance_Users`
- `DL_Finance_RW`
- `ROLE_HelpDesk_Level1`

## Accounts

- Standard users: `first.last`
- Administrative accounts: `adm-first.last`
- Service accounts: `svc-application-purpose`

## Tickets and Records

- Incidents: `INC-AREA-###`
- Service requests: `SR-AREA-###`
- Problems: `PRB-AREA-###`
- Changes: `CHG-AREA-###`
- Risks: `RSK-AREA-###`

## Evidence Files

Format: `<date>-<system>-<activity>-<result>.<ext>`

Example: `2026-07-18-dc01-replication-validation-pass.txt`
