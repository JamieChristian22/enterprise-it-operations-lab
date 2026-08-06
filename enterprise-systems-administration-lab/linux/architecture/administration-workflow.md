# Linux Administration Workflow

```mermaid
flowchart TD
    A[Request or Alert] --> B[Validate scope and business impact]
    B --> C[Collect system state]
    C --> D{Known issue?}
    D -->|Yes| E[Follow approved runbook]
    D -->|No| F[Investigate logs, services, resources, and network]
    E --> G[Apply least-risk change]
    F --> G
    G --> H[Validate service and security controls]
    H --> I[Document commands, output, and resolution]
    I --> J[Close request or escalate with evidence]
```

## Change Discipline

- Record the original state before making changes.
- Prefer reversible changes.
- Back up configuration files before editing.
- Use `visudo` for sudo policy validation.
- Use `sshd -t` before restarting SSH.
- Use `systemd-analyze verify` for unit-file validation.
- Confirm that monitoring, logging, and backups remain operational.
