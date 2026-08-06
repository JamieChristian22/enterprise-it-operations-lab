# ADR-002 — Dedicated Management Network

## Decision

Place administrative workstations and management services in a dedicated VLAN.

## Rationale

- Reduces exposure of RDP, SSH, and WinRM.
- Improves auditability.
- Supports privileged access controls.
