# Enterprise IT Operations Lab — Documentation Center

**Owner:** Jamie Christian  
**Version:** 2.0  
**Status:** Portfolio Release  
**Last reviewed:** August 6, 2026  
**Review cycle:** Quarterly

## Purpose
This folder contains the operating documentation for a simulated hybrid enterprise environment supporting identity, endpoints, Windows and Linux servers, Microsoft 365, AWS infrastructure, monitoring, backup, incident response, change control, and service reporting.

The documentation is designed to show how an IT operations technician or junior systems administrator would deploy, operate, troubleshoot, secure, and continuously improve a production-style environment.

## Recommended reading order
1. `executive-overview.md` — business context, scope, architecture, and success criteria.
2. `environment-baseline.md` — systems inventory, network plan, naming standards, and dependencies.
3. `implementation-guide.md` — build sequence, controls, validation, and acceptance criteria.
4. `operations-handbook.md` — daily, weekly, monthly, and quarterly operating procedures.
5. `incident-response-process.md` — severity, triage, communication, escalation, and closure.
6. `change-management-process.md` — standard, normal, and emergency change control.
7. `troubleshooting-guide.md` — diagnostic method and scenario-based runbooks.
8. `service-level-objectives.md` — operational targets and measurement rules.
9. `known-errors-and-problem-management.md` — recurring issues, workarounds, and prevention.
10. `documentation-index.md` — evidence and artifact traceability.
11. `portfolio-evidence-guide.md` — recruiter and interview presentation path.
12. `skills-matrix.md` — job-role alignment.

## Documentation standards
- Procedures identify the owner, trigger, inputs, pass criteria, evidence, and escalation path.
- All examples use fictional systems and sanitized data.
- No production credentials, secrets, personal data, or customer information are included.
- Each procedure is written so another technician can repeat it without relying on undocumented knowledge.

## Environment summary
- Identity: Active Directory Domain Services and Microsoft Entra ID
- Endpoints: Windows 11 managed with Microsoft Intune
- Servers: Windows Server 2022 and Ubuntu Server 24.04 LTS
- Productivity: Microsoft 365
- Cloud: AWS VPC, EC2, CloudWatch, Systems Manager, and AWS Backup
- Automation: PowerShell, Bash, and Terraform
- Service management: incident, request, change, problem, knowledge, and asset processes
