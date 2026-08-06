# 🏢 Enterprise Systems Administration Lab

![Windows Server](https://img.shields.io/badge/Windows%20Server-2022-0078D4?style=for-the-badge\&logo=windows\&logoColor=white)
![Active Directory](https://img.shields.io/badge/Active%20Directory-Administration-0052CC?style=for-the-badge\&logo=microsoft\&logoColor=white)
![Microsoft 365](https://img.shields.io/badge/Microsoft%20365-Administration-D83B01?style=for-the-badge\&logo=microsoftoffice\&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-Administration-FCC624?style=for-the-badge\&logo=linux\&logoColor=black)
![PowerShell](https://img.shields.io/badge/PowerShell-Automation-5391FE?style=for-the-badge\&logo=powershell\&logoColor=white)
![Python](https://img.shields.io/badge/Python-Automation-3776AB?style=for-the-badge\&logo=python\&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-Scripting-4EAA25?style=for-the-badge\&logo=gnubash\&logoColor=white)

![Prometheus](https://img.shields.io/badge/Prometheus-Monitoring-E6522C?style=flat-square\&logo=prometheus\&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-Dashboards-F46800?style=flat-square\&logo=grafana\&logoColor=white)
![Ansible](https://img.shields.io/badge/Ansible-Configuration%20Management-EE0000?style=flat-square\&logo=ansible\&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-CI%20Validation-2088FF?style=flat-square\&logo=githubactions\&logoColor=white)
![Security](https://img.shields.io/badge/Security-Hardening-success?style=flat-square\&logo=securityscorecard\&logoColor=white)
![Portfolio](https://img.shields.io/badge/Portfolio-Job%20Ready-blueviolet?style=flat-square)
![Status](https://img.shields.io/badge/Status-Active%20Development-brightgreen?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

A production-style enterprise systems administration portfolio demonstrating how Windows Server, Active Directory, Linux, Microsoft 365, identity, security, automation, monitoring, backup, patching, virtualization, and operational support work together in a realistic business environment.

> ⚠️ **Portfolio Disclaimer:** All organizations, domains, users, systems, incidents, tickets, reports, logs, and datasets in this lab are synthetic and created for educational and portfolio demonstration purposes. No confidential production information is included.

---

## 📌 Project Overview

Northstar Services is a simulated mid-sized organization operating a mixed Windows, Linux, Microsoft 365, cloud, and virtualization environment.

The infrastructure team supports:

* 🪟 Windows Server systems
* 🏢 Active Directory Domain Services
* 🌐 DNS and Group Policy
* ☁️ Microsoft 365 and Microsoft Entra ID
* 🐧 Linux application and utility servers
* 📁 File and print services
* 🔐 Enterprise PKI and certificate operations
* 🖥️ Virtualization platforms
* 📊 Monitoring and alerting
* 💾 Backup and disaster recovery
* 🔄 Patch and vulnerability management
* 🛡️ Security hardening and privileged access
* 🎫 Incident, request, and change management
* ⚙️ PowerShell, Bash, Python, Ansible, and DSC automation

The goal of this lab is to demonstrate practical systems administration skills through technical configurations, automation, documentation, operational records, troubleshooting scenarios, and validation evidence.

---

## 🎯 Target Roles

This project is designed to support applications for:

* Systems Administrator I
* Junior Systems Administrator
* Windows Server Administrator
* Linux Administrator I
* Infrastructure Support Engineer
* IT Operations Engineer
* IT Support Engineer I
* Technical Support Engineer
* Cloud Support Engineer
* Cloud Operations Analyst
* Junior DevOps Engineer
* Identity and Access Management Support
* Microsoft 365 Administrator
* Infrastructure Security Administrator

---

## 🏗️ Environment Architecture

```mermaid
flowchart TB
    USERS[👥 Employees and Administrators]

    USERS --> AD[🏢 Active Directory Domain Services]
    USERS --> M365[☁️ Microsoft 365 and Entra ID]

    AD --> DC1[🖥️ NSS-DC01]
    AD --> DC2[🖥️ NSS-DC02]
    AD --> GPO[📋 Group Policy]
    AD --> DNS[🌐 DNS Services]
    AD --> PKI[🔐 Enterprise PKI]

    M365 --> EXO[📧 Exchange Online]
    M365 --> TEAMS[💬 Microsoft Teams]
    M365 --> SPO[📁 SharePoint Online]
    M365 --> OD[☁️ OneDrive]

    WIN[🪟 Windows Servers] --> FILE[📂 File and Print Services]
    WIN --> APP[⚙️ Application Services]
    WIN --> BACKUP[💾 Backup Services]
    WIN --> PATCH[🔄 Patch Management]

    LINUX[🐧 Linux Servers] --> WEB[🌐 Application and Web Services]
    LINUX --> AUTO[🤖 Automation and Scheduled Jobs]

    HYP[🖥️ Virtualization] --> WIN
    HYP --> LINUX

    MON[📊 Prometheus and Grafana] --> WIN
    MON --> LINUX
    MON --> APP

    SEC[🛡️ Security Operations] --> AD
    SEC --> M365
    SEC --> WIN
    SEC --> LINUX
```

---

## 🖥️ Example Systems

| Hostname           | Platform            | Primary Role                             |
| ------------------ | ------------------- | ---------------------------------------- |
| `NSS-DC01`         | Windows Server 2022 | Primary domain controller and DNS        |
| `NSS-DC02`         | Windows Server 2022 | Secondary domain controller and DNS      |
| `NSS-FILE01`       | Windows Server 2022 | File services and FSRM                   |
| `NSS-PRINT01`      | Windows Server 2022 | Print services                           |
| `NSS-APP01`        | Windows Server 2022 | Internal application services            |
| `NSS-MON01`        | Linux               | Prometheus and Grafana monitoring        |
| `NSS-LINUX-APP01`  | Ubuntu Server       | Linux application services               |
| `NSS-LINUX-DB01`   | Rocky Linux         | Database services                        |
| `NSS-ROOT-CA01`    | Windows Server      | Offline Root Certificate Authority       |
| `NSS-ISSUING-CA01` | Windows Server      | Enterprise Issuing Certificate Authority |
| `NSS-ADM01`        | Windows 11          | Administrative workstation               |

---

# 🧰 Core Technical Areas

## 🏢 Active Directory Administration

![AD DS](https://img.shields.io/badge/AD%20DS-Identity%20Management-0052CC?style=flat-square)
![DNS](https://img.shields.io/badge/DNS-Name%20Resolution-0078D4?style=flat-square)
![PowerShell](https://img.shields.io/badge/PowerShell-Automation-5391FE?style=flat-square\&logo=powershell\&logoColor=white)

The Active Directory section demonstrates:

* 👤 User and computer lifecycle management
* 🏗️ Organizational Unit design
* 👥 Security and distribution groups
* 🔑 Password resets and account unlocks
* 🛂 Role-based access control
* 🔒 Account lockout investigations
* 🔁 Replication and domain health validation
* 🧹 Stale-object reviews
* 👑 Privileged-group reporting
* ⚙️ PowerShell automation

➡️ [Explore Active Directory](./active-directory/)

---

## 🪟 Windows Server Administration

![Windows Server](https://img.shields.io/badge/Windows%20Server-2022-0078D4?style=flat-square\&logo=windows\&logoColor=white)
![SMB](https://img.shields.io/badge/SMB-File%20Services-blue?style=flat-square)
![Backup](https://img.shields.io/badge/Backup-Restore%20Validation-success?style=flat-square)

The Windows Server section includes:

* 🏗️ Server build and baseline procedures
* 🧩 Roles and features
* ⚙️ Windows services
* 📜 Event Viewer operations
* 📁 File and print services
* 🔐 SMB shares and NTFS permissions
* 📏 File Server Resource Manager
* 💽 Disk and volume management
* ⏰ Scheduled Tasks
* 🔒 RDP and firewall hardening
* 💾 Windows Server Backup
* 🔐 Certificate administration
* 📈 Performance monitoring
* ⚙️ PowerShell automation

➡️ [Explore Windows Server](./windows-server/)

---

## 🐧 Linux Administration

![Ubuntu](https://img.shields.io/badge/Ubuntu-Server-E95420?style=flat-square\&logo=ubuntu\&logoColor=white)
![Rocky Linux](https://img.shields.io/badge/Rocky%20Linux-Server-10B981?style=flat-square\&logo=rockylinux\&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-Automation-4EAA25?style=flat-square\&logo=gnubash\&logoColor=white)

The Linux section demonstrates:

* 👤 User and group administration
* 🔐 SSH and sudo management
* 📦 Package and patch management
* ⚙️ systemd service operations
* 🔥 UFW and firewalld
* 💽 Storage and filesystem administration
* 📜 Log management
* 💾 Backup and restore
* 🛡️ Security auditing
* 🤖 Bash automation
* 🚨 Incident troubleshooting

➡️ [Explore Linux Administration](./linux/)

---

## ☁️ Microsoft 365 Administration

![Microsoft 365](https://img.shields.io/badge/Microsoft%20365-Administration-D83B01?style=flat-square\&logo=microsoftoffice\&logoColor=white)
![Entra ID](https://img.shields.io/badge/Entra%20ID-Identity-0078D4?style=flat-square\&logo=microsoftazure\&logoColor=white)
![Exchange Online](https://img.shields.io/badge/Exchange%20Online-Messaging-0078D4?style=flat-square)

The Microsoft 365 section covers:

* 👤 Microsoft Entra ID user administration
* 🎟️ License assignment and capacity reporting
* 📧 Exchange Online
* 📬 Shared mailboxes
* 📢 Distribution groups
* 💬 Microsoft Teams
* 📁 SharePoint Online
* ☁️ OneDrive
* 🔐 MFA
* 🛡️ Conditional Access
* 🌍 Guest access
* 🔄 User onboarding and offboarding
* ⚙️ Microsoft Graph and Exchange Online PowerShell

➡️ [Explore Microsoft 365](./microsoft-365/)

---

## 📋 Group Policy Engineering

![Group Policy](https://img.shields.io/badge/Group%20Policy-GPO-0052CC?style=flat-square)
![LAPS](https://img.shields.io/badge/Windows%20LAPS-Local%20Admin%20Security-success?style=flat-square)

The Group Policy section demonstrates:

* 🏷️ GPO design and naming standards
* 🛡️ Security baselines
* 🔑 Password and account policies
* 🔥 Windows Firewall policies
* 💽 Drive mapping
* 🖨️ Printer deployment
* 📜 PowerShell logging
* 🔐 Windows LAPS
* 💾 GPO backup and restore
* 🧪 Troubleshooting with `gpresult` and Resultant Set of Policy

➡️ [Explore Group Policy](./group-policy/)

---

## 🔐 Enterprise PKI

![PKI](https://img.shields.io/badge/PKI-Certificate%20Services-6A5ACD?style=flat-square)
![TLS](https://img.shields.io/badge/TLS-Certificate%20Lifecycle-success?style=flat-square)
![AD CS](https://img.shields.io/badge/AD%20CS-Enterprise%20CA-0078D4?style=flat-square)

The PKI section includes:

* 🏗️ Two-tier PKI architecture
* 🔒 Offline Root CA
* 🏢 Enterprise Issuing CA
* 📜 Active Directory Certificate Services
* 🧩 Certificate templates
* 🔄 Auto-enrollment
* 🌐 AIA and CDP publication
* 🚫 CRL management
* ✅ OCSP
* 🔐 IIS TLS certificates
* ♻️ Certificate renewal and revocation
* 💾 Backup and disaster recovery

➡️ [Explore PKI](./pki/)

---

## 📊 Monitoring and Observability

![Prometheus](https://img.shields.io/badge/Prometheus-Metrics-E6522C?style=flat-square\&logo=prometheus\&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-Dashboards-F46800?style=flat-square\&logo=grafana\&logoColor=white)
![Alertmanager](https://img.shields.io/badge/Alertmanager-Alert%20Routing-orange?style=flat-square)

The monitoring section demonstrates:

* 📈 Prometheus configuration
* 📊 Grafana dashboard provisioning
* 🐧 Linux Node Exporter
* 🪟 Windows Exporter
* 🌐 Blackbox Exporter
* 📦 cAdvisor
* 🚨 Infrastructure alerting
* 📣 Alertmanager routing
* ✅ Availability monitoring
* 📉 Capacity trends
* 🎯 SLI, SLO, and error-budget reporting
* 📖 Alert runbooks and incidents

➡️ [Explore Monitoring](./monitoring/)

---

## 🛡️ Security Hardening

![Security](https://img.shields.io/badge/Security-Hardening-success?style=flat-square\&logo=securityscorecard\&logoColor=white)
![Defender](https://img.shields.io/badge/Microsoft%20Defender-Endpoint%20Security-00A4EF?style=flat-square\&logo=microsoft\&logoColor=white)
![auditd](https://img.shields.io/badge/auditd-Linux%20Auditing-black?style=flat-square)

The security section includes:

* 🪟 Windows security baselines
* 🐧 Linux security baselines
* 🛡️ Microsoft Defender
* 🔥 Windows Firewall
* 📜 Advanced Audit Policy
* ⚙️ PowerShell logging
* 🔐 Windows LAPS
* 🚫 SMB and legacy-protocol hardening
* 🔑 SSH hardening
* 👑 sudo access control
* 📋 auditd
* 👥 Privileged access reviews
* 🚨 Emergency access accounts
* 🧯 Security incident response

➡️ [Explore Security](./security/)

---

## 🔄 Patch Management

![Windows Update](https://img.shields.io/badge/Windows%20Update-Patching-0078D4?style=flat-square\&logo=windows\&logoColor=white)
![Linux Patching](https://img.shields.io/badge/Linux-Patching-FCC624?style=flat-square\&logo=linux\&logoColor=black)
![Compliance](https://img.shields.io/badge/Patch%20Compliance-Reporting-success?style=flat-square)

The patching section demonstrates:

* 🪟 Windows patching
* 🐧 Linux patching
* 🎯 Deployment rings
* 🗓️ Maintenance windows
* 🩺 Pre-patch validation
* ✅ Post-patch testing
* 🔄 Reboot coordination
* 🚨 Emergency patching
* ↩️ Rollback and recovery
* 📊 Patch compliance reporting
* 📝 Exception management
* ⚙️ PowerShell and Bash automation

➡️ [Explore Patch Management](./patching/)

---

## 💾 Backup and Disaster Recovery

![Backup](https://img.shields.io/badge/Backup-Operations-0052CC?style=flat-square)
![Disaster Recovery](https://img.shields.io/badge/Disaster%20Recovery-RTO%20%2F%20RPO-critical?style=flat-square)
![Restore Testing](https://img.shields.io/badge/Restore%20Testing-Validated-success?style=flat-square)

The backup and disaster-recovery sections cover:

* 💾 Backup policy and schedules
* 🪟 Windows Server backup
* 🐧 Linux backup workflows
* 🏢 Active Directory recovery
* 🔐 PKI backup and recovery
* ☁️ Microsoft 365 data protection
* ✅ Restore testing
* ⏱️ Recovery Time Objective
* 📍 Recovery Point Objective
* 🧪 Disaster-recovery exercises
* 📑 After-action reporting

➡️ [Explore Backups](./backups/)
➡️ [Explore Disaster Recovery](./disaster-recovery/)

---

## 🖥️ Virtualization

![Virtualization](https://img.shields.io/badge/Virtualization-Lab-6A5ACD?style=flat-square)
![Hyper-V](https://img.shields.io/badge/Hyper--V-Windows%20Virtualization-0078D4?style=flat-square)
![VMware](https://img.shields.io/badge/VMware-Virtualization-607078?style=flat-square\&logo=vmware\&logoColor=white)

The virtualization section demonstrates:

* 🖥️ Virtual machine deployment
* 🪟 Hyper-V-style administration
* 🧱 VMware-style operations
* 🌐 Virtual networking
* 📦 Templates and snapshots
* 📊 Resource allocation
* 💾 VM backup
* 🧰 Guest tools
* 📈 Capacity planning
* 🧯 Virtualization troubleshooting

➡️ [Explore Virtualization](./virtualization/)

---

## ⚙️ Configuration Management

![Ansible](https://img.shields.io/badge/Ansible-Automation-EE0000?style=flat-square\&logo=ansible\&logoColor=white)
![PowerShell DSC](https://img.shields.io/badge/PowerShell%20DSC-Desired%20State-5391FE?style=flat-square\&logo=powershell\&logoColor=white)

The configuration-management section includes:

* ⚙️ PowerShell Desired State Configuration
* 🤖 Ansible automation
* 📋 Configuration standards
* 🔁 Idempotent deployment concepts
* 🛡️ Server baseline enforcement
* 🔍 Configuration drift detection
* ✅ Validation and reporting

➡️ [Explore Configuration Management](./configuration-management/)

---

## 🤖 Automation Library

![PowerShell](https://img.shields.io/badge/PowerShell-Scripts-5391FE?style=flat-square\&logo=powershell\&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-Scripts-4EAA25?style=flat-square\&logo=gnubash\&logoColor=white)
![Python](https://img.shields.io/badge/Python-Utilities-3776AB?style=flat-square\&logo=python\&logoColor=white)

The scripts section contains reusable administrative tooling written in:

* ⚙️ PowerShell
* 🐚 Bash
* 🐍 Python

Automation covers:

* 🏢 Active Directory health
* 👤 User provisioning
* 🔒 Account-lockout evidence
* ☁️ Microsoft 365 licensing
* 🌍 Guest-user reviews
* 🔄 Patch status
* 💾 Backup freshness
* 📊 Server capacity
* 🔐 Certificate expiration
* 🐧 Linux health
* 🛡️ Linux user and security audits
* 📄 CSV, JSON, and HTML reporting

➡️ [Explore Scripts](./scripts/)

---

# 📚 IT Operations Documentation

| Area                                   | Purpose                                                              |
| -------------------------------------- | -------------------------------------------------------------------- |
| 📖 [Runbooks](./runbooks/)             | Step-by-step incident and service recovery procedures                |
| 📋 [SOPs](./sops/)                     | Repeatable standard operating procedures                             |
| 🧠 [Knowledge Base](./knowledge-base/) | Internal technical support documentation                             |
| 🎫 [Tickets](./tickets/)               | Realistic incidents, requests, problems, and changes                 |
| 🚨 [Incidents](./incidents/)           | Root-cause analysis and remediation records                          |
| 🔧 [Changes](./changes/)               | Planned infrastructure change records                                |
| 📊 [Reports](./reports/)               | Executive, operational, security, compliance, and capacity reporting |
| 🗂️ [Datasets](./datasets/)            | Synthetic operational data used for analysis                         |
| 🏗️ [Architecture](./architecture/)    | Enterprise environment design documentation                          |
| 🖼️ [Diagrams](./diagrams/)            | Visual workflows and technical diagrams                              |

---

## 🗺️ Repository Map

```text
enterprise-systems-administration-lab/
├── active-directory/
├── architecture/
├── backups/
├── capacity/
├── changes/
├── configuration-management/
├── datasets/
├── diagrams/
├── disaster-recovery/
├── docs/
├── group-policy/
├── identity/
├── incidents/
├── knowledge-base/
├── linux/
├── microsoft-365/
├── monitoring/
├── patching/
├── pki/
├── reports/
├── runbooks/
├── scripts/
├── security/
├── sops/
├── tickets/
├── virtualization/
├── windows-server/
├── LICENSE
├── MANIFEST-SHA256.txt
├── MANIFEST.sha256
└── README.md
```

---

# 🔄 Administrative Workflows

## 👤 User Onboarding

```mermaid
flowchart LR
    HR[📋 Approved HR Request] --> AD[👤 Create AD Account]
    AD --> GROUPS[👥 Assign Security Groups]
    GROUPS --> M365[☁️ Assign Microsoft 365 License]
    M365 --> MAIL[📧 Provision Mailbox]
    MAIL --> TEAMS[💬 Add Teams and SharePoint Access]
    TEAMS --> MFA[🔐 Require MFA Registration]
    MFA --> VALIDATE[✅ Validate and Document]
```

## 🚨 Incident Management

```mermaid
flowchart LR
    ALERT[🚨 Alert or User Report] --> TRIAGE[🩺 Triage]
    TRIAGE --> INVESTIGATE[🔍 Collect Evidence]
    INVESTIGATE --> RESTORE[🛠️ Restore Service]
    RESTORE --> VALIDATE[✅ Validate Resolution]
    VALIDATE --> RCA[📑 Root-Cause Analysis]
    RCA --> IMPROVE[📈 Update Monitoring or Runbook]
```

## 🔄 Patch Management

```mermaid
flowchart LR
    ASSESS[🔍 Assess Updates] --> R0[🧪 Ring 0 Pilot]
    R0 --> TEST[✅ Validate]
    TEST --> R1[1️⃣ Ring 1]
    R1 --> R2[2️⃣ Production]
    R2 --> R3[3️⃣ Critical Infrastructure]
    R3 --> REPORT[📊 Compliance Report]
```

---

# ⚙️ Automation and Validation

## PowerShell

```powershell
Get-ChildItem ./scripts/powershell -Recurse -Filter *.ps1
```

## Bash

```bash
find ./scripts/bash -type f -name "*.sh"
```

## Python

```bash
find ./scripts/python -type f -name "*.py"
```

### Validation Coverage

* ✅ PowerShell syntax checks
* ✅ Bash syntax checks
* ✅ Python validation
* ✅ Empty-file checks
* ✅ Required-file checks
* ✅ GitHub Actions workflows
* ✅ Structured CSV and JSON outputs
* ✅ Configuration-driven automation

---

# 🧾 Evidence Standard

Operational claims should be supported with:

* 📜 Redacted command output
* ⚙️ PowerShell transcripts
* 📤 Configuration exports
* 📊 CSV or JSON reports
* 🪟 Event log summaries
* ✅ Validation checklists
* 🧪 Test results
* 🏗️ Architecture diagrams
* 🚨 Incident records
* 🔧 Change records
* 💾 Restore-test results
* 📈 Dashboard exports

> Sample or simulated evidence must be labeled clearly and must not be represented as production data.

---

# 🔒 Security and Safety

* 🔐 No production credentials are included.
* 🧪 No real customer or employee data is used.
* 🔁 Example passwords and domains must be replaced before lab use.
* 👀 Administrative scripts should be reviewed before execution.
* ⚠️ Destructive actions should be tested with `-WhatIf` or in an isolated lab.
* 🗝️ Secrets should be supplied through secure environment variables or secret stores.
* 🧹 Sensitive logs and exports should be redacted before publication.
* 🛡️ Security controls should be piloted before broad deployment.

---

# 🧠 Skills Demonstrated

## 🪟 Windows and Identity

* Windows Server 2022
* Active Directory Domain Services
* DNS
* Group Policy
* Windows LAPS
* NTFS and SMB permissions
* Windows Server Backup
* Event Viewer
* Task Scheduler
* PowerShell

## 🐧 Linux

* Ubuntu
* Rocky Linux
* Bash
* systemd
* SSH
* sudo
* auditd
* UFW and firewalld
* Log management

## ☁️ Microsoft Cloud

* Microsoft 365 Admin Center
* Microsoft Entra ID
* Exchange Online
* Microsoft Teams
* SharePoint Online
* OneDrive
* Microsoft Graph PowerShell
* Conditional Access
* MFA

## 🏗️ Infrastructure Operations

* Monitoring and alerting
* Patch management
* Backup and recovery
* Disaster recovery
* Capacity planning
* PKI
* Virtualization
* Configuration management
* Incident management
* Change management
* Root-cause analysis

## 🤖 Automation

* PowerShell
* Bash
* Python
* Ansible
* PowerShell DSC
* GitHub Actions
* CSV, JSON, HTML, and Markdown reporting

---

# 💬 Interview Discussion Topics

This project can support interview answers about:

* 🪟 Building and securing Windows Server systems
* 🔁 Troubleshooting Active Directory replication
* 👤 Managing user onboarding and offboarding
* 📋 Designing Group Policy
* 📁 Troubleshooting file-share permissions
* ☁️ Administering Microsoft 365
* 🛡️ Hardening Windows and Linux systems
* 🔐 Managing certificates and PKI
* 🚨 Responding to infrastructure incidents
* 🔄 Designing patch rings
* 💾 Testing backup restores
* 📊 Monitoring availability and capacity
* ⚙️ Automating repetitive administration
* 📝 Documenting technical work for different audiences

---

# 📄 Suggested Resume Project Entry

**Enterprise Systems Administration Lab**
*Windows Server, Active Directory, Linux, Microsoft 365, PowerShell, Prometheus, Grafana*

* Designed a simulated enterprise infrastructure supporting Windows Server, Active Directory, Linux, Microsoft 365, virtualization, PKI, monitoring, patching, backup, and security operations.
* Automated identity, health, compliance, backup, patch, capacity, and certificate reporting using PowerShell, Bash, and Python.
* Developed operational runbooks, incident reports, change records, security baselines, recovery procedures, and executive IT reports.
* Implemented role-based access, Group Policy, certificate auto-enrollment, monitoring alerts, patch deployment rings, and backup validation workflows.
* Documented realistic troubleshooting scenarios involving services, file permissions, authentication, patch failures, certificate issues, performance degradation, and service outages.

---

# ✅ Validation Checklist

* [ ] Repository links open correctly
* [ ] Scripts contain no embedded credentials
* [ ] Sample data is labeled
* [ ] Markdown files render correctly
* [ ] Mermaid diagrams render correctly
* [ ] PowerShell syntax tests pass
* [ ] Bash syntax tests pass
* [ ] Python validation passes
* [ ] No empty placeholder files remain
* [ ] Evidence is redacted
* [ ] Documentation matches implemented features

---

# 🚀 Future Enhancements

* 🧪 Add Pester tests for PowerShell
* 🔍 Add ShellCheck and PSScriptAnalyzer to CI
* 🪟 Add Windows Admin Center evidence
* ☁️ Add Intune and Azure Arc administration
* 🛡️ Add Microsoft Sentinel integration
* 🏗️ Add infrastructure-as-code deployment
* 📜 Add centralized Windows Event Forwarding
* 💾 Add additional disaster-recovery exercises
* 📊 Add month-over-month operational trend reporting

---

# 👤 Author

## Jamie Christian

![IT Support](https://img.shields.io/badge/Focus-IT%20Support-blue?style=flat-square)
![Systems Administration](https://img.shields.io/badge/Focus-Systems%20Administration-0078D4?style=flat-square)
![Cloud Support](https://img.shields.io/badge/Focus-Cloud%20Support-00A4EF?style=flat-square)
![Infrastructure](https://img.shields.io/badge/Focus-Infrastructure%20Operations-6A5ACD?style=flat-square)
![Security](https://img.shields.io/badge/Focus-Security%20Administration-success?style=flat-square)
![Automation](https://img.shields.io/badge/Focus-Automation-orange?style=flat-square)

---

# 📜 License

This project is released under the repository’s included license.

Review [LICENSE](./LICENSE) for details.
