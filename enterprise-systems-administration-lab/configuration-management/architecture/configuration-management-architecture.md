# Configuration Management Architecture

```mermaid
flowchart LR
  Git[Git repository] --> Review[Peer review and approval]
  Review --> Runner[Ansible control node]
  Runner --> WinRM[WinRM over HTTPS]
  WinRM --> DC[Domain Controllers]
  WinRM --> FS[File Servers]
  WinRM --> WEB[IIS Servers]
  WinRM --> OPS[Monitoring and Backup Servers]
  Runner --> Evidence[Execution artifacts]
  Git --> DSC[DSC configurations]
  DSC --> MOF[Compiled MOF packages]
  MOF --> LCM[Local Configuration Manager]
  LCM --> Managed[Desired-state enforcement]
  Managed --> Compliance[Compliance reports]
```

The control node performs orchestration while DSC enforces durable Windows state. Git provides version history, reviewability, and rollback points. Evidence is retained separately from source code and excludes credentials.
