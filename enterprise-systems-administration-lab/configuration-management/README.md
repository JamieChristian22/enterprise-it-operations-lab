# Enterprise Configuration Management Lab

A production-style Windows configuration management portfolio demonstrating Ansible and PowerShell Desired State Configuration (DSC) used together to build, harden, validate, and continuously assess enterprise Windows servers.

## Business scenario
Northstar Services operates eight Windows servers across identity, file services, web hosting, monitoring, and backup. Manual configuration caused inconsistent services, firewall rules, Windows features, registry settings, and local security controls. This project establishes a controlled configuration-as-code operating model with peer review, staged deployment, drift detection, rollback, and evidence retention.

## Outcomes
- Standardized Windows Server 2022 baseline across eight managed nodes.
- Reusable Ansible roles for baseline hardening, IIS, file services, monitoring, patching, and audit policy.
- DSC configurations for Windows features, services, registry, file content, firewall, and LCM drift correction.
- Pre-change, post-change, idempotency, and compliance validation.
- Documented change, incident, problem, and exception workflows.
- 30 acceptance tests completed with a 100% pass result.

## Repository map
- `architecture/` operating model and data flows.
- `ansible/` inventories, variables, roles, playbooks, templates, tests, and reports.
- `dsc/` configurations, LCM settings, composite resources, compliance, and tests.
- `powershell/` independent validation and reporting tools.
- `runbooks/` deployment, rollback, drift, secrets, and recovery procedures.
- `evidence/` sanitized execution and compliance output.
- `tickets/` completed operational records.
- `reports/` management and technical summaries.
- `tests/` portfolio acceptance results.

## Safe execution
The included examples use the lab domain `northstar.local`, documentation-only credentials, and non-secret variable references. Real credentials must be supplied through Ansible Vault, a credential manager, or an automation platform at runtime.
