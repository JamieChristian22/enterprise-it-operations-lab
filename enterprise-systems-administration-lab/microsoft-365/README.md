# Enterprise Microsoft 365 Administration Lab

A production-style Microsoft 365 administration portfolio project demonstrating identity lifecycle management, license operations, Exchange Online, Microsoft Teams, SharePoint Online, OneDrive, Microsoft Entra ID, security controls, PowerShell automation, incident response, reporting, and operational documentation.

## Business Scenario

Northstar Services is a 150-user organization using Microsoft 365 Business Premium. The IT operations team supports employee onboarding, access changes, mailbox administration, Teams collaboration, SharePoint sites, OneDrive recovery, multifactor authentication, Conditional Access, license management, security reporting, and employee offboarding.

This project models the work of a Microsoft 365 administrator supporting a real business tenant.

## Environment

| Component | Configuration |
|---|---|
| Tenant | `northstarservices.onmicrosoft.com` |
| Primary domain | `northstarservices.com` |
| User count | 150 |
| Main license | Microsoft 365 Business Premium |
| Identity platform | Microsoft Entra ID |
| Messaging | Exchange Online |
| Collaboration | Microsoft Teams |
| Content | SharePoint Online and OneDrive |
| Administration | Microsoft Graph PowerShell and Exchange Online PowerShell |
| Ticketing model | Incident, request, access, and change records |

## Demonstrated Skills

- Create, update, disable, and remove Microsoft 365 users.
- Assign and remove licenses based on role.
- Manage security groups, Microsoft 365 groups, and distribution groups.
- Create and administer user and shared mailboxes.
- Configure mailbox permissions and automatic replies.
- Manage Teams membership and ownership.
- Administer SharePoint site permissions.
- Recover deleted OneDrive and Exchange Online content.
- Enforce multifactor authentication and Conditional Access.
- Audit privileged roles and guest accounts.
- Automate common tasks with PowerShell.
- Investigate service, access, mail-flow, and collaboration incidents.
- Validate changes and produce operational evidence.

## Repository Structure

```text
microsoft-365/
├── README.md
├── architecture/
├── configuration/
├── documentation/
├── evidence/
├── incidents/
├── knowledge-base/
├── powershell/
├── reports/
├── runbooks/
├── tickets/
└── validation/
```

## Safe Lab Usage

The scripts use sample tenant values and are intended for a Microsoft 365 developer or test tenant. Review variables, permissions, and licensing before execution. Use least-privileged administrative roles and test changes before production deployment.

## Recommended Demonstration Flow

1. Review the tenant architecture and access model.
2. Follow the tenant setup and administrator preparation guide.
3. Provision a sample employee using the onboarding script.
4. Configure Exchange Online, Teams, SharePoint, and OneDrive access.
5. Apply MFA and Conditional Access controls.
6. Run validation and reporting scripts.
7. Complete the offboarding workflow.
8. Review the incidents, tickets, runbooks, and evidence files.

## Portfolio Value

This project demonstrates practical administration across the Microsoft 365 platform rather than listing product names or isolated commands. It shows how identity, messaging, collaboration, security, automation, incident response, and documentation operate together.
