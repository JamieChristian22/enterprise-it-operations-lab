# Linux Lab Architecture

```mermaid
flowchart LR
    A[Administrator Workstation] -->|SSH key authentication| B[nss-linux-01<br/>Ubuntu Server 24.04]
    C[Help Desk Workstation] -->|Restricted SSH and sudo| B
    B --> D[/srv/company-share]
    B --> E[Northstar API<br/>systemd service]
    B --> F[/var/log and journald]
    B --> G[/var/backups/northstar]
    B --> H[APT repositories]
    I[UFW Firewall] --- B
```

## Trust Boundaries

- Administrative SSH is permitted only from `10.20.30.0/24`.
- Password-based SSH authentication is disabled.
- Root login over SSH is disabled.
- Administrative privileges are granted through group-based sudo policy.
- Application, shared-data, log, and backup paths use separate ownership and permission controls.

## Core Operational Flows

1. Administrator authenticates with an SSH key.
2. Sudo policy authorizes approved elevated actions.
3. systemd manages service startup, restart, and health state.
4. journald and application logs provide troubleshooting data.
5. scheduled scripts create backups and collect health information.
6. UFW restricts exposed network ports.
