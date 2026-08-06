# CHG-CM-001 — Deploy Windows Baseline

- Type: Normal change
- Risk: Medium
- Window: 2026-07-17 22:00–23:30 ET
- Scope: Eight Windows Server 2022 nodes
- Approvals: Infrastructure Lead, Security Analyst, Change Manager
- Implementation: Canary deployment followed by serial batches of two.
- Validation: Required services running, SMBv1 absent, firewall enabled, script-block logging enabled.
- Result: Successful; 8/8 nodes compliant; no user impact.
- Rollback: Not required.
