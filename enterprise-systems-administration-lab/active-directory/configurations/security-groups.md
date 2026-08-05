# Security Group Design

| Group | Type | Members/Purpose | Nested Into |
|---|---|---|---|
| GG-FIN-Analysts | Global Security | Finance analyst job role | DL-FS-Finance-RW |
| GG-HR-Generalists | Global Security | HR generalist role | DL-FS-HR-RW |
| GG-IT-HelpDesk | Global Security | Tier-1 support staff | Delegated OU ACLs |
| GG-IT-DesktopSupport | Global Security | Workstation administration | DL-LocalAdmin-Workstations |
| DL-FS-Finance-RW | Domain Local Security | Finance share Modify | NTFS/share ACL |
| DL-FS-HR-RW | Domain Local Security | HR share Modify | NTFS/share ACL |
| DL-LocalAdmin-Workstations | Domain Local Security | Managed local admin assignment | Workstation policy |

Direct user assignment to resource ACLs is prohibited. Privileged groups are reviewed weekly in the lab and quarterly as a governance control.
