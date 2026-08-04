# Resume and Interview Guide

## Resume Bullets
- Resolved a high-priority Microsoft Outlook startup incident by validating Microsoft 365 account health, analyzing application processes and Windows event logs, testing Safe Mode, and performing Microsoft 365 Apps Quick Repair.
- Restored email and calendar access within 1 hour 28 minutes while meeting SLA, avoiding data loss, and validating mailbox synchronization, send/receive, calendar, and Teams integration.
- Authored a root cause analysis and reusable knowledge-base article, improving the repeatability of Outlook startup troubleshooting.
- Developed PowerShell utilities for local Outlook diagnostics, Event Viewer export, process analysis, and Microsoft 365 connectivity testing.

## STAR Story

### Situation
A Finance user could not launch Outlook after a Windows update and restart. Email and calendar access were blocked.

### Task
Restore productivity quickly, determine whether the issue was cloud-side or endpoint-side, protect user data, and document the incident.

### Action
I verified the Microsoft 365 account, license, mailbox, and service health. I checked Task Manager and found Outlook starting and exiting. I correlated the behavior with an Application log error, tested Outlook Safe Mode, then completed Microsoft 365 Apps Quick Repair. I verified mailbox sync, send/receive, calendar, Teams integration, and Event Viewer stability.

### Result
Outlook returned to normal operation, the user confirmed the fix, no data was lost, the High-priority SLA was met, and I published a reusable knowledge article.

## Technical Interview Questions

### Why check Microsoft 365 Admin Center first?
To rule out account disablement, license problems, mailbox provisioning issues, sign-in blocks, and tenant service incidents before changing the endpoint.

### What does Outlook Safe Mode do?
It launches Outlook with reduced functionality and disables many add-ins and customizations. It is useful for isolating extension-related startup problems.

### When would you use Online Repair?
When Quick Repair fails, application corruption remains, or multiple Office applications are affected. Online Repair is more disruptive and may require reauthentication.

### What Event Viewer information matters?
Timestamp, level, source, Event ID, faulting application, faulting module, exception code, and correlation with the user's reported failure.

### What would you avoid?
Deleting the Outlook profile, clearing credentials, modifying the registry, or reinstalling Office before collecting evidence and trying lower-risk steps.

### When would you escalate?
If the issue persists after Online Repair, affects multiple users, involves Exchange Online, requires Conditional Access changes, or suggests malware, hardware failure, or unsupported add-ins.

## Behavioral Interview Questions

### Tell me about a time you handled an urgent issue.
Use the STAR story above and emphasize prioritization, communication, evidence-based troubleshooting, and verification.

### How do you communicate with a frustrated user?
Acknowledge impact, explain the next action in plain language, provide realistic updates, avoid blame, and confirm success before closure.

### How do you document your work?
Record symptoms, impact, environment, evidence, actions, results, root cause, verification, customer confirmation, and prevention guidance.
