# Ansible Implementation

The Ansible implementation manages Windows Server through WinRM over HTTPS. The inventory separates canary, domain controller, file server, web server, and operations workloads. Roles are reusable and playbooks compose them by service responsibility.

Example syntax check:
```bash
ansible-playbook playbooks/site.yml --syntax-check
```

Example canary check-mode run:
```bash
ansible-playbook playbooks/site.yml --limit lab_canary --check --diff
```
