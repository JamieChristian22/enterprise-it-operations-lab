# Enterprise Microsoft 365 Outlook Support Lab

[![Project Type](https://img.shields.io/badge/project-enterprise%20help%20desk-0A66C2)](#)
[![Platform](https://img.shields.io/badge/platform-Windows%2011-0078D4)](#)
[![Microsoft 365](https://img.shields.io/badge/Microsoft%20365-Admin%20%7C%20Outlook-D83B01)](#)
[![ITSM](https://img.shields.io/badge/ITSM-Zendesk-03363D)](#)
[![Status](https://img.shields.io/badge/status-complete-2EA44F)](#)

## Executive Summary

This repository documents a complete enterprise-style Help Desk incident in which a Windows 11 user could not launch Microsoft Outlook after a workstation update. The project demonstrates the full support lifecycle: ticket intake, impact assessment, Microsoft 365 account validation, process analysis, Event Viewer investigation, Outlook Safe Mode testing, Microsoft 365 Apps repair, post-repair verification, root cause analysis, customer communication, closure, and knowledge-base publication.

The work is designed for entry-level Help Desk, Service Desk, Desktop Support, IT Support, and Cloud Support candidates who need a portfolio project that shows more than isolated screenshots. Every document and script in this repository supports one consistent incident, `INC-10487`, and uses the same fictional organization, user, device, timestamps, and resolution details.

## Business Scenario

**Organization:** Contoso Corporation  
**Department:** Finance  
**Requester:** Alex Johnson  
**Technician:** Jamie Christian  
**Workstation:** `CTSO-LT-0184`  
**Operating system:** Windows 11 Enterprise 24H2  
**Application:** Microsoft Outlook for Microsoft 365 Apps for enterprise  
**Ticket:** `INC-10487`  
**Priority:** High  
**Issue:** Outlook fails to launch after Windows updates  
**Business impact:** Email, calendar, Teams integration, and customer communication are disrupted  
**Final status:** Solved  
**Resolution time:** 1 hour 28 minutes  
**Root cause:** Corrupted Microsoft 365 application components following an update  
**Resolution:** Microsoft 365 Apps Quick Repair followed by functional validation

## Project Objectives

1. Demonstrate a repeatable and security-conscious enterprise troubleshooting process.
2. Show practical use of Microsoft 365 Admin Center, Task Manager, Event Viewer, Outlook Safe Mode, and Microsoft Support and Recovery Assistant.
3. Produce complete incident documentation suitable for an internal IT support team.
4. Create reusable PowerShell tools for evidence collection and connectivity checks.
5. Show how a resolved incident becomes a published knowledge-base article.
6. Provide interview and resume material derived directly from the technical work.

## Skills Demonstrated

- Windows 11 endpoint troubleshooting
- Microsoft 365 user and license validation
- Outlook startup and profile troubleshooting
- Task Manager process analysis
- Event Viewer filtering and error correlation
- Microsoft Support and Recovery Assistant
- Microsoft 365 Apps Quick Repair
- Basic PowerShell automation
- Incident prioritization and SLA handling
- Root cause analysis
- Customer communication
- Knowledge management
- Verification and closure discipline
- Security and privacy awareness
- Escalation judgment

## Incident Lifecycle

```text
User reports Outlook failure
        |
        v
Zendesk incident created and prioritized
        |
        v
Microsoft 365 account, license, and service health checked
        |
        v
Task Manager confirms Outlook process behavior
        |
        v
Event Viewer identifies Outlook application failure
        |
        v
Outlook Safe Mode isolates add-ins and profile factors
        |
        v
Microsoft 365 Apps Quick Repair performed
        |
        v
Outlook launch, mailbox sync, calendar, and send/receive verified
        |
        v
Root cause documented
        |
        v
Customer confirms service restored
        |
        v
Ticket solved and knowledge article published
```

## Technical Environment

| Component | Configuration | Purpose |
|---|---|---|
| Windows endpoint | Windows 11 Enterprise 24H2 | User workstation |
| Microsoft 365 | Microsoft 365 Apps for enterprise | Outlook application suite |
| Exchange Online | Cloud mailbox service | Email and calendar |
| Microsoft 365 Admin Center | User/license/service validation | Administrative review |
| Zendesk | Incident and communication tracking | ITSM workflow |
| Task Manager | Process and resource review | Application diagnosis |
| Event Viewer | Application error review | Failure evidence |
| Outlook Safe Mode | `outlook.exe /safe` | Add-in isolation |
| SaRA / Office Repair | Quick Repair | Application remediation |
| PowerShell | Evidence collection and connectivity testing | Repeatable diagnostics |

## Repository Structure

```text
enterprise-microsoft-365-outlook-support-lab-10of10/
├── README.md
├── LICENSE
├── CHANGELOG.md
├── CONTRIBUTING.md
├── SECURITY.md
├── PROJECT_MANIFEST.json
├── docs/
│   ├── 01-project-charter.md
│   ├── 02-environment-and-architecture.md
│   ├── 03-incident-timeline.md
│   ├── 04-incident-report.md
│   ├── 05-root-cause-analysis.md
│   ├── 06-post-incident-review.md
│   ├── 07-lessons-learned.md
│   ├── 08-resume-and-interview-guide.md
│   ├── runbooks/
│   │   ├── outlook-startup-troubleshooting.md
│   │   ├── microsoft-365-user-validation.md
│   │   └── escalation-matrix.md
│   └── policies/
│       ├── priority-and-sla-guide.md
│       ├── evidence-handling-standard.md
│       └── customer-communication-standard.md
├── tickets/
│   ├── INC-10487-ticket-record.md
│   ├── INC-10487-conversation.md
│   ├── INC-10487-resolution-notes.md
│   ├── incident-register.csv
│   └── verification-checklist.csv
├── scripts/
│   ├── Collect-OutlookDiagnostics.ps1
│   ├── Test-M365Connectivity.ps1
│   ├── Export-OutlookEventLogs.ps1
│   ├── Get-OutlookProcessReport.ps1
│   └── modules/Support.Common.psm1
├── sample-output/
│   ├── outlook-diagnostics-sample.txt
│   ├── connectivity-results-sample.csv
│   ├── event-log-summary-sample.csv
│   └── process-report-sample.csv
├── evidence/
│   └── README.md
└── diagrams/
    └── README.md
```

## Evidence Mapping

The project is built around the following evidence sequence:

| # | Evidence file | What it proves |
|---:|---|---|
| 01 | `01-zendesk-outlook-ticket-created.png` | Incident intake, priority, impact |
| 02 | `02-microsoft-365-admin-center.png` | Account, license, and service validation |
| 03 | `03-task-manager-outlook-process-analysis.png` | Process-level investigation |
| 04 | `04-event-viewer-outlook-application-error.png` | Technical error evidence |
| 05 | `05-outlook-safe-mode.png` | Add-in/profile isolation step |
| 06 | `06-microsoft-support-and-recovery-assistant-office-quick-repair.png` | Remediation performed |
| 07 | `07-outlook-functionality-verified.png` | Successful post-repair operation |
| 08 | `08-zendesk-root-cause-analysis.png` | Internal technical documentation |
| 09 | `09-zendesk-ticket-resolved.png` | Customer communication and closure |
| 10 | `10-knowledge-base-outlook-will-not-open.png` | Knowledge transfer and reuse |

The screenshots are not included in this ZIP. The `evidence/README.md` explains exactly where to add them and how they connect to the documentation.

## Troubleshooting Methodology

### 1. Confirm and scope the issue

The technician begins by confirming that Outlook fails to launch, determining when the issue began, identifying whether other Microsoft 365 services are affected, and documenting business impact. Because the requester is in Finance and cannot access email or calendar, the incident is classified as High priority.

### 2. Validate the cloud account

The Microsoft 365 Admin Center is used to verify that the account is active, the Microsoft 365 Apps license is assigned, sign-in is allowed, and no service-health advisory explains the issue. This prevents unnecessary endpoint remediation when the actual cause is tenant-side.

### 3. Inspect the local process state

Task Manager is used to identify stuck or orphaned Outlook processes. The technician confirms whether `OUTLOOK.EXE` starts, hangs, or exits immediately. Any orphaned process is ended before retesting.

### 4. Review Windows logs

The Application log is filtered around the reported failure time. An Outlook-related application error is correlated with the user's report. Event information is recorded without exposing personal data.

### 5. Isolate extensions and profile behavior

Outlook is launched using Safe Mode. This disables nonessential add-ins and customizations. The result helps distinguish an add-in problem from damaged application components.

### 6. Repair Microsoft 365 Apps

Because the cloud account is healthy, no persistent process remains, and the application failure continues, Microsoft 365 Apps Quick Repair is performed. Quick Repair is selected before Online Repair because it is faster and less disruptive.

### 7. Verify service restoration

The technician validates:
- Outlook launches normally outside Safe Mode.
- The mailbox connects to Microsoft 365.
- Inbox synchronization completes.
- A test email can be sent and received.
- Calendar opens and synchronizes.
- Teams integration remains functional.
- No new Outlook error appears in Event Viewer.

### 8. Document and close

The root cause, evidence, corrective action, verification results, preventive guidance, and customer confirmation are entered in Zendesk. The incident is moved to Solved and a reusable knowledge-base article is published.

## Root Cause Summary

The immediate cause was corrupted Microsoft 365 application components following a workstation update. The conclusion is supported by:

- Outlook startup failure outside Safe Mode
- Application error evidence in Event Viewer
- Healthy Microsoft 365 account and license
- No tenant-wide service-health issue
- Successful Microsoft 365 Apps Quick Repair
- Normal Outlook behavior after repair
- No recurrence during verification

The technician did not claim that Windows Update itself was definitively defective; instead, the update timing was treated as a contributing condition and the damaged Office components were treated as the confirmed repair target.

## Security and Privacy Controls

- All identities and system names are fictional.
- No passwords, tokens, MFA secrets, personal addresses, or production data are included.
- Administrative changes require requester identity verification.
- Screenshots intended for GitHub should use fictional tenant and device information.
- Diagnostic exports should be reviewed before public publication.
- Scripts save results locally and do not transmit data externally.

## Automation Included

The PowerShell scripts in `scripts/` are written for an elevated Windows PowerShell or PowerShell 7 session. They include:

- Timestamped output folders
- Basic error handling
- Consistent CSV/text output
- Local event-log collection
- Outlook process inspection
- DNS and TCP 443 connectivity tests
- Registry and Office installation checks
- Clear status messages
- No destructive actions

The scripts intentionally collect evidence and validate conditions. They do not silently modify Office, registry, profiles, or credentials.

## Success Criteria

The project is considered successful when:

- The incident record contains complete intake, impact, priority, and ownership information.
- Evidence supports each major troubleshooting decision.
- The chosen remediation is proportionate and documented.
- Outlook functionality is verified through multiple tests.
- The user confirms service restoration.
- The root cause and corrective action are documented.
- A reusable knowledge article is published.
- The repository contains fully authored content and no sensitive data.
- Scripts are readable, safe, and reusable.

## Resume Bullets

- Resolved a high-priority Microsoft Outlook startup incident by validating Microsoft 365 account health, analyzing `OUTLOOK.EXE` in Task Manager, correlating Application log errors, testing Outlook Safe Mode, and completing Microsoft 365 Apps Quick Repair.
- Restored email and calendar functionality for a Finance user and verified mailbox synchronization, send/receive operations, calendar access, and Microsoft Teams integration before closing the incident.
- Documented root cause, corrective actions, verification results, and preventive recommendations in Zendesk, then published a reusable Outlook troubleshooting knowledge-base article.
- Developed PowerShell utilities to collect Outlook process data, export relevant Windows event logs, and test Microsoft 365 DNS and HTTPS connectivity.

## Interview Talking Points

**How did you avoid jumping directly to a repair?**  
I first validated the Microsoft 365 account, license, sign-in state, and service health. Then I checked local processes and Windows logs. That separated cloud-side causes from endpoint-side causes before remediation.

**Why did you use Safe Mode?**  
Safe Mode disables nonessential add-ins and customizations. It is a low-risk diagnostic step that helps determine whether an extension or customization contributes to the startup issue.

**Why Quick Repair instead of Online Repair?**  
Quick Repair is less disruptive and usually faster. I would escalate to Online Repair only if Quick Repair failed or if corruption remained.

**How did you know the issue was resolved?**  
I verified normal launch outside Safe Mode, mailbox synchronization, send/receive, calendar operation, Teams integration, and absence of new Outlook application errors. The user also confirmed normal operation.

**What would trigger escalation?**  
Repeated crashes after Online Repair, widespread tenant impact, mailbox corruption, profile recreation failure, authentication policy problems, or evidence requiring Exchange Online or endpoint engineering privileges.


## Quality Assurance

This repository includes automated quality checks:

- PowerShell syntax parsing
- Pester unit tests for shared support functions
- Repository completeness tests
- Unfinished-marker detection
- GitHub Actions workflow for pull requests and pushes
- SHA-256 project manifest

Run locally on Windows PowerShell 7:

```powershell
Install-Module Pester -MinimumVersion 5.5.0 -Scope CurrentUser
Invoke-Pester -Path .\tests -Output Detailed
```

## Publication-Ready Knowledge Article

The complete internal article is available at:

- [`docs/09-knowledge-base-outlook-will-not-open.md`](docs/09-knowledge-base-outlook-will-not-open.md)

## Additional Sample Operations Data

A five-ticket service-desk register is included at:

- [`tickets/sample-incident-register.csv`](tickets/sample-incident-register.csv)

The primary detailed case remains `INC-10487`; the additional records demonstrate category variety and basic operational reporting.


## Limitations

This is a controlled portfolio simulation, not a production tenant. The screenshots, user identities, tenant, and device names are fictional. The project demonstrates the workflow and documentation expected in a real environment while avoiding the use of real customer data.

## License

This project is provided under the MIT License for portfolio and educational use.
