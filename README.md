# 🖥️ Enterprise IT Support & Systems Operations Portfolio

> **Production-inspired enterprise IT portfolio demonstrating hands-on skills across Help Desk Support, Active Directory, Systems Administration, Microsoft 365, IT Operations, infrastructure troubleshooting, automation, monitoring, backup, and disaster recovery.**

This repository contains interconnected technical labs designed to simulate the responsibilities, workflows, documentation standards, and troubleshooting processes found in modern enterprise IT environments.

The portfolio demonstrates progression from **frontline technical support → identity administration → IT operations → systems administration → infrastructure and cloud operations**.

---

## 📌 Portfolio Overview

The projects in this repository focus on practical enterprise IT responsibilities rather than isolated tutorials.

### Core Technical Areas

- 🎧 Help Desk & Technical Support
- 👤 Active Directory Administration
- 🔐 Identity & Access Management
- ⚙️ Windows Server Administration
- 🐧 Linux Administration
- 📧 Microsoft 365 & Outlook Support
- 🌐 Network Troubleshooting
- 📊 Infrastructure Monitoring
- 🚨 Incident Management
- 🔍 Root Cause Analysis
- 🤖 PowerShell, Bash & Python Automation
- 🏗️ Configuration Management
- 💾 Backup & Recovery
- 🚑 Disaster Recovery
- 📚 Knowledge Base Development
- 📋 SOPs, Runbooks & Operational Documentation
- 🖥️ Virtualization

> **Lab Disclaimer:** All organizations, employees, users, tickets, incidents, infrastructure, IP addresses, and business scenarios represented in this repository are fictional and were created for technical training and portfolio demonstration.

---

# 🚀 Enterprise Labs

## 01 — 👤 Enterprise Active Directory User Management Lab

**Focus:** Enterprise identity lifecycle, access administration, security groups, permissions, and Group Policy.

### Skills Demonstrated

- Active Directory Users and Computers
- User provisioning
- Employee onboarding and offboarding
- Organizational Unit management
- Security groups and group membership
- Password resets and account unlocks
- Account lifecycle administration
- NTFS and shared-folder permissions
- Group Policy Objects
- Computer objects
- PowerShell administration
- Access validation
- Administrative auditing
- Identity documentation

### Identity Lifecycle

```text
Access Request
      │
      ▼
Validate Request
      │
      ▼
Create / Modify Identity
      │
      ▼
Assign Security Groups
      │
      ▼
Apply Resource Permissions
      │
      ▼
Apply Organizational Policy
      │
      ▼
Validate Access
      │
      ▼
Document & Audit
```

### Enterprise Scenarios

- New employee provisioning
- Department-based access
- Security-group assignment
- Password resets
- Locked-account recovery
- Shared-folder access
- Permission changes
- Group Policy administration
- Employee offboarding
- PowerShell-assisted administration

📂 **Explore the Lab:**  
[`enterprise-active-directory-user-management-lab/`](./enterprise-active-directory-user-management-lab/)

---

## 02 — 🎧 Enterprise Help Desk Support Lab

**Focus:** Tier 1 / Tier 2 enterprise technical support and service desk operations.

### Skills Demonstrated

- Ticket lifecycle management
- Incident classification
- Priority assignment
- SLA awareness
- User communication
- Windows troubleshooting
- Microsoft 365 troubleshooting
- Outlook troubleshooting
- Password and account support
- Printer troubleshooting
- VPN troubleshooting
- Network diagnostics
- Escalation procedures
- Knowledge Base development
- Resolution documentation

### Support Workflow

```text
User Reports Issue
        │
        ▼
Create Ticket
        │
        ▼
Gather Information
        │
        ▼
Classify & Prioritize
        │
        ▼
Initial Troubleshooting
        │
   ┌────┴────┐
   ▼         ▼
Resolved  Unresolved
   │         │
   ▼         ▼
Validate  Escalate
   │         │
   └────┬────┘
        ▼
  Documentation
        │
        ▼
     Closure
```

📂 **Explore the Lab:**  
[`enterprise-helpdesk-support-lab/`](./enterprise-helpdesk-support-lab/)

---

## 03 — 📊 Enterprise IT Operations Lab

**Focus:** Infrastructure operations, monitoring, incident response, operational procedures, and service reliability.

### Skills Demonstrated

- Infrastructure monitoring
- System health validation
- Incident detection
- Incident triage
- Incident response
- Root cause analysis
- Service validation
- Asset inventory
- Operational dashboards
- Preventive maintenance
- Backup verification
- Operational checklists
- Runbook execution
- Incident documentation
- Escalation workflows
- Post-incident analysis

### IT Operations Lifecycle

```text
Monitoring
    │
    ▼
Detection
    │
    ▼
Validation
    │
    ▼
Triage
    │
    ▼
Investigation
    │
    ▼
Mitigation
    │
    ▼
Recovery
    │
    ▼
Root Cause Analysis
    │
    ▼
Documentation
    │
    ▼
Preventive Improvement
```

### Operational Artifacts

- Dashboards
- Datasets
- Incident records
- Asset inventories
- Operational documentation
- Architecture diagrams
- Checklists
- Procedures
- Runbooks
- Root cause analyses

📂 **Explore the Lab:**  
[`enterprise-it-operations-lab/`](./enterprise-it-operations-lab/)

---

## 04 — 📧 Enterprise Microsoft 365 & Outlook Support Lab

**Focus:** Microsoft 365 administration and enterprise messaging support.

### Skills Demonstrated

- Microsoft 365 administration
- Outlook Desktop
- Outlook Web
- Exchange Online concepts
- User mailbox troubleshooting
- Shared mailbox support
- Distribution groups
- Mailbox permissions
- License administration
- Authentication troubleshooting
- Outlook profile troubleshooting
- Mail-flow troubleshooting
- User communication
- Ticket resolution
- Knowledge Base documentation

### Troubleshooting Workflow

```text
Issue Reported
      │
      ▼
User Validation
      │
      ▼
Service Validation
      │
      ▼
Authentication
      │
      ▼
Licensing
      │
      ▼
Mailbox
      │
      ▼
Client Troubleshooting
      │
      ▼
Resolution
      │
      ▼
Documentation
```

📂 **Explore the Lab:**  
[`enterprise-microsoft-365-outlook-support-lab/`](./enterprise-microsoft-365-outlook-support-lab/)

---

## 05 — ⚙️ Enterprise Systems Administration Lab

**Focus:** Windows Server, Linux, virtualization, configuration management, backup, recovery, and infrastructure administration.

### Skills Demonstrated

- Windows Server administration
- Linux administration
- PowerShell
- Bash
- Server configuration
- Service management
- File-system administration
- Storage administration
- System monitoring
- Patch management
- Performance troubleshooting
- Event and log analysis
- Backup administration
- Restore procedures
- Disaster recovery
- Virtualization
- Configuration management
- Ansible
- PowerShell DSC
- Administrative documentation

### Systems Administration Lifecycle

```text
Provision
    │
    ▼
Configure
    │
    ▼
Secure
    │
    ▼
Validate
    │
    ▼
Monitor
    │
    ▼
Maintain
    │
    ▼
Patch
    │
    ▼
Backup
    │
    ▼
Recover
    │
    ▼
Document
```

📂 **Explore the Lab:**  
[`enterprise-systems-administration-lab/`](./enterprise-systems-administration-lab/)

---

# 🏗️ Repository Architecture

```text
enterprise-it-support-and-systems-operations/
│
├── enterprise-active-directory-user-management-lab/
│   └── Active Directory, identity lifecycle, GPO & permissions
│
├── enterprise-helpdesk-support-lab/
│   └── Tickets, troubleshooting, SLA, escalation & KB
│
├── enterprise-it-operations-lab/
│   └── Monitoring, incidents, RCA, inventory & operations
│
├── enterprise-microsoft-365-outlook-support-lab/
│   └── Microsoft 365, Exchange concepts & Outlook support
│
├── enterprise-systems-administration-lab/
│   └── Windows, Linux, automation, backup, DR & virtualization
│
├── LICENSE
│
└── README.md
```

---

# 🧰 Technical Skills Matrix

| Domain | Technologies / Skills |
|---|---|
| **Help Desk** | Ticket management, troubleshooting, SLA, escalation |
| **Windows** | Windows 11, Windows Server, Event Viewer, PowerShell |
| **Linux** | Linux administration, Bash, services, logs, permissions |
| **Identity** | Active Directory, users, groups, OUs, RBAC concepts |
| **Microsoft 365** | Microsoft 365, Outlook, mailbox administration |
| **Networking** | TCP/IP, DNS, DHCP, VPN, connectivity diagnostics |
| **Security** | Least privilege, access control, auditing, permissions |
| **Automation** | PowerShell, Bash, Python |
| **Configuration** | Ansible, PowerShell DSC |
| **Virtualization** | VirtualBox, VMware concepts |
| **Monitoring** | Event logs, performance monitoring, dashboards |
| **Incident Management** | Detection, triage, mitigation, recovery, RCA |
| **Resilience** | Backup, restore, recovery, disaster recovery |
| **Documentation** | SOPs, KB articles, runbooks, incident reports |
| **Operations** | Checklists, inventory, health checks, maintenance |

---

# 🔧 Troubleshooting Methodology

A structured troubleshooting methodology is used throughout the portfolio.

### 1. Identify the Problem

- Gather symptoms
- Determine scope
- Identify affected users and systems
- Review recent changes

### 2. Establish a Theory

- Identify likely causes
- Prioritize hypotheses
- Determine required diagnostics

### 3. Test the Theory

- Collect evidence
- Review logs
- Run diagnostics
- Reproduce the issue when appropriate
- Confirm or reject the suspected cause

### 4. Implement Resolution

- Apply controlled remediation
- Follow change procedures
- Minimize user and business impact

### 5. Verify Functionality

- Test affected services
- Confirm expected functionality
- Validate resolution with the user when applicable

### 6. Document

- Record troubleshooting actions
- Document root cause
- Record resolution
- Capture validation evidence
- Identify preventive actions

> **Objective:** Demonstrate evidence-based troubleshooting rather than trial-and-error remediation.

---

# 🚨 Incident Management

The Help Desk and IT Operations labs follow a structured incident-management lifecycle:

```text
Detect
  ↓
Log
  ↓
Classify
  ↓
Prioritize
  ↓
Diagnose
  ↓
Resolve / Escalate
  ↓
Recover
  ↓
Validate
  ↓
Close
  ↓
Knowledge Capture / RCA
```

### Incident Priority Model

| Priority | Example | Operational Response |
|---|---|---|
| **P1 — Critical** | Business-critical service unavailable | Immediate response |
| **P2 — High** | Major service degradation | High-priority response |
| **P3 — Medium** | Limited user or business impact | Standard response |
| **P4 — Low** | Minor issue or service request | Scheduled response |

---

# 🤖 Automation

Automation is used to reduce repetitive administrative work while maintaining validation, logging, and human oversight.

### Automation Areas

- User provisioning
- Account administration
- Password operations
- Group membership
- System health checks
- Service validation
- Log collection
- Administrative reporting
- Configuration management
- Routine maintenance

### Automation Lifecycle

```text
Identify
   ↓
Define
   ↓
Validate
   ↓
Automate
   ↓
Execute
   ↓
Verify
   ↓
Log
   ↓
Document
```

---

# 🔐 Security & Access Management

Security principles are integrated throughout the portfolio.

### Core Practices

- Least-privilege access
- Role-based access concepts
- Security-group-based permissions
- Controlled administrative access
- Account lifecycle management
- Password policies
- Authentication troubleshooting
- Access validation
- NTFS permissions
- Administrative auditing
- Secure offboarding

### Access Model

```text
User
  ↓
Identity
  ↓
Security Group
  ↓
Role / Permission
  ↓
Resource
  ↓
Audit
```

---

# 💾 Backup, Recovery & Disaster Recovery

The portfolio demonstrates operational resilience through:

- Backup procedures
- Backup validation
- Restore testing
- Recovery procedures
- Disaster recovery documentation
- Recovery checklists
- System validation
- Recovery evidence
- Post-recovery documentation

### Recovery Lifecycle

```text
Backup
  ↓
Verify
  ↓
Monitor
  ↓
Incident
  ↓
Assess
  ↓
Recover
  ↓
Validate
  ↓
Document
```

---

# 📚 Documentation & Knowledge Management

Enterprise IT requires technical work to be repeatable and transferable.

The portfolio includes:

- 📘 Standard Operating Procedures
- 📗 Knowledge Base Articles
- 📙 Troubleshooting Guides
- 📕 Incident Reports
- 📓 Root Cause Analyses
- 📒 Runbooks
- 📋 Operational Checklists
- 🗂️ Asset Inventories
- 📊 Operational Reports
- 🏗️ Architecture Documentation
- 🚑 Disaster Recovery Procedures

Professional documentation is designed to answer:

1. **What happened?**
2. **Why did it happen?**
3. **What evidence supports the diagnosis?**
4. **How was it resolved?**
5. **How was the resolution validated?**
6. **How can recurrence be prevented?**

---

# 🛡️ Operational Principles

### Least Privilege

Users and administrators receive only the permissions necessary to perform authorized responsibilities.

### Repeatability

Routine administrative procedures are standardized through documentation and automation.

### Auditability

Administrative activity and significant system changes should be traceable.

### Recoverability

Critical systems should have documented and validated recovery procedures.

### Documentation

Resolved incidents and repeatable procedures should contribute to organizational knowledge.

### Escalation

Issues outside the support boundary should be escalated with complete troubleshooting evidence.

### Validation

A technical change is not complete until functionality has been verified.

### Continuous Improvement

Operational incidents should produce lessons that improve future reliability and support procedures.

---

# 📈 Technical Progression

```text
HELP DESK SUPPORT
        │
        ▼
IDENTITY ADMINISTRATION
        │
        ▼
IT OPERATIONS
        │
        ▼
SYSTEMS ADMINISTRATION
        │
        ▼
CLOUD / INFRASTRUCTURE
```

This progression demonstrates development from frontline technical support toward systems, infrastructure, and cloud operations.

---

# 🎯 Target Roles

### IT Support

- Help Desk Technician
- Service Desk Analyst
- IT Support Specialist
- Desktop Support Technician
- Technical Support Specialist
- IT Support Engineer I

### Systems & Infrastructure

- Junior Systems Administrator
- Systems Administrator I
- Infrastructure Support Engineer
- Infrastructure Support Technician
- Junior Infrastructure Engineer
- Infrastructure Operations Analyst

### Cloud & Operations

- Cloud Support Associate
- Cloud Support Technician
- Cloud Operations Analyst
- Cloud Operations Engineer I
- Junior Cloud Engineer
- Junior Platform Support Engineer

---

# ⭐ Portfolio Highlights

- ✅ Enterprise Active Directory administration
- ✅ User onboarding and offboarding
- ✅ Group Policy administration
- ✅ Windows Server administration
- ✅ Linux administration
- ✅ Microsoft 365 support
- ✅ Outlook troubleshooting
- ✅ Enterprise ticket management
- ✅ Incident response
- ✅ Root cause analysis
- ✅ Network troubleshooting
- ✅ PowerShell automation
- ✅ Bash administration
- ✅ Python automation
- ✅ Configuration management
- ✅ Infrastructure monitoring
- ✅ Backup and recovery
- ✅ Disaster recovery
- ✅ Virtualization
- ✅ Asset inventory
- ✅ Knowledge Base development
- ✅ SOP development
- ✅ Operational runbooks
- ✅ Architecture documentation
- ✅ Security and least-privilege concepts

---

# 🔎 Recruiter Quick Start

| Area | Portfolio Lab | Primary Evidence |
|---|---|---|
| 🎧 **Help Desk** | [Help Desk Lab](./enterprise-helpdesk-support-lab/) | Troubleshooting, tickets, SLA, escalation, KB |
| 👤 **Active Directory** | [Active Directory Lab](./enterprise-active-directory-user-management-lab/) | AD, onboarding, groups, permissions, GPO, PowerShell |
| 📊 **IT Operations** | [IT Operations Lab](./enterprise-it-operations-lab/) | Monitoring, incidents, RCA, inventory, runbooks |
| 📧 **Microsoft 365** | [Microsoft 365 Lab](./enterprise-microsoft-365-outlook-support-lab/) | M365, Outlook, mailbox and user support |
| ⚙️ **Systems Administration** | [Systems Administration Lab](./enterprise-systems-administration-lab/) | Windows, Linux, automation, virtualization, backup, DR |

---

# 💼 What This Portfolio Demonstrates

This repository is designed to answer a practical hiring question:

> **Can the candidate approach enterprise IT work using structured troubleshooting, administration, validation, automation, and documentation?**

### 🔧 Troubleshoot

Systematically investigate technical issues using symptoms, logs, diagnostics, testing, and validation.

### 👤 Administer

Manage users, groups, permissions, policies, systems, services, and enterprise resources.

### 🖥️ Operate

Perform operational tasks across Windows, Linux, Microsoft 365, identity, and infrastructure environments.

### 🚨 Respond

Detect, triage, investigate, mitigate, resolve, and document operational incidents.

### 🤖 Automate

Use scripting and configuration-management technologies to improve repeatability and reduce manual administrative work.

### 📊 Monitor

Evaluate system health, operational status, logs, events, infrastructure conditions, and service performance.

### 💾 Recover

Apply documented backup, restore, and disaster-recovery procedures.

### 📚 Document

Create professional SOPs, runbooks, KB articles, troubleshooting guides, incident reports, and operational records.

---

# 🧠 Portfolio Philosophy

The objective of this portfolio is not simply to demonstrate that a technical command can be executed.

The objective is to demonstrate the **complete operational lifecycle**:

```text
Business / User Requirement
            │
            ▼
       Investigation
            │
            ▼
       Technical Work
            │
            ▼
        Validation
            │
            ▼
      Documentation
            │
            ▼
    Operational Handoff
            │
            ▼
  Continuous Improvement
```

A production IT environment depends on more than technical knowledge.

> **Technical Execution + Troubleshooting + Communication + Security + Documentation + Operational Discipline**

---

# 👨‍💻 About This Repository

This repository was developed as a hands-on technical environment for demonstrating practical enterprise IT support, systems administration, and infrastructure operations skills.

Each lab is structured around realistic operational responsibilities rather than isolated technology demonstrations.

The portfolio will continue to evolve as additional systems administration, infrastructure automation, cloud operations, monitoring, and security capabilities are developed.

---

# 📜 License

This repository is licensed under the **MIT License**.

See [`LICENSE`](./LICENSE) for details.

---

# ⚠️ Disclaimer

This repository is a simulated technical lab and professional portfolio environment.

All organizations, employees, users, tickets, incidents, IP addresses, hostnames, infrastructure, business scenarios, and operational records are fictional and were created solely for educational, laboratory, and professional portfolio purposes.

No proprietary company information, customer information, production credentials, or real production environments are represented.
