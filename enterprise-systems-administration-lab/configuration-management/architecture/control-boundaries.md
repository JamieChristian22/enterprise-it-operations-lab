# Control Boundaries

| Boundary | Control |
|---|---|
| Source code | Protected main branch and peer review |
| Credentials | Ansible Vault or external credential store |
| Network | WinRM HTTPS 5986 restricted to the control node |
| Privilege | Dedicated automation account with delegated rights |
| Deployment | Canary first, serial batches, maintenance windows |
| Evidence | Sanitized logs retained for 365 days |
| Recovery | Version rollback plus DSC reapplication |
