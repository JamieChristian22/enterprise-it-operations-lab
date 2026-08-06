# Tenant Setup Guide

## 1. Tenant Preparation

1. Confirm the tenant name and primary domain.
2. Add and verify `northstarservices.com`.
3. Configure DNS records for Exchange Online.
4. Set the organization name, support contact, and privacy information.
5. Configure the release preference for administrators and selected users.
6. Review service health and message center settings.

## 2. Administrator Accounts

Create separate cloud-only administrator accounts:

| Account | Role |
|---|---|
| `jamie.admin@northstarservices.com` | Global Reader and task-specific roles |
| `exchange.admin@northstarservices.com` | Exchange Administrator |
| `teams.admin@northstarservices.com` | Teams Administrator |
| `sharepoint.admin@northstarservices.com` | SharePoint Administrator |
| `helpdesk.admin@northstarservices.com` | Helpdesk Administrator |

Global Administrator should be reserved for tenant-level emergencies and protected by strong authentication.

## 3. Baseline Groups

- All Employees
- IT Operations
- Help Desk
- Finance Users
- Human Resources
- Sales Users
- Managers
- Contractors
- License-M365-Business-Premium
- Conditional-Access-Exclusions-Emergency

## 4. Validation

- Confirm domain status.
- Confirm administrator MFA registration.
- Confirm emergency access account monitoring.
- Confirm licensing availability.
- Confirm Exchange Online and Teams provisioning.
- Confirm audit search availability.
