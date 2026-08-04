# Environment and Architecture

## Logical Architecture

The user accesses Exchange Online through Microsoft Outlook installed as part of Microsoft 365 Apps for enterprise. The local workstation authenticates to Microsoft 365 over HTTPS. The Help Desk technician validates the cloud identity and license through Microsoft 365 Admin Center and diagnoses the endpoint using Task Manager, Event Viewer, Outlook Safe Mode, and Microsoft Support and Recovery Assistant.

```text
Alex Johnson
    |
    v
CTSO-LT-0184 (Windows 11 Enterprise 24H2)
    |
    +--> Microsoft Outlook
    |        |
    |        +--> Exchange Online
    |        +--> Calendar
    |        +--> Teams integration
    |
    +--> Task Manager
    +--> Event Viewer
    +--> SaRA / Office Repair
    +--> PowerShell diagnostics
             |
             v
        Local evidence exports

Jamie Christian
    |
    +--> Zendesk
    +--> Microsoft 365 Admin Center
```

## Endpoint Baseline
- Device: `CTSO-LT-0184`
- User: Alex Johnson
- Department: Finance
- OS: Windows 11 Enterprise 24H2
- Office channel: Current Channel
- Outlook architecture: 64-bit
- Network: Corporate LAN/VPN with outbound HTTPS
- Time synchronization: Enabled
- Antivirus: Microsoft Defender for Endpoint
- Privilege model: Standard user; technician elevation used for repair

## Cloud Baseline
- Tenant: Contoso Corporation
- User principal name: `alex.johnson@contoso.com`
- Account state: Active
- Sign-in state: Allowed
- License: Microsoft 365 E3
- Exchange Online mailbox: Provisioned
- Service health: No active Outlook/Exchange advisory related to the incident

## Evidence Sources
- Zendesk ticket history
- Microsoft 365 Admin Center account panel
- Task Manager process list
- Windows Event Viewer Application log
- Outlook Safe Mode behavior
- SaRA/Office repair completion
- Post-repair Outlook screen
- PowerShell-generated local reports

## Technical Assumptions
The lab does not connect to a live Contoso tenant. All administrative records and screenshots are simulated with fictional data. The scripts are designed for a Windows endpoint where the operator has permission to read local diagnostic data.
