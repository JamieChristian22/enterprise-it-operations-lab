# Ticketing System Deployment Guide

## 1. Create the Service Desk
Create a Zendesk-style instance named **CTS Service Desk**. Configure email intake, web-form intake, agent workspace, and internal notes.

## 2. Roles
- **End User:** submits and views own tickets.
- **Tier 1 Agent:** handles common incidents and service requests.
- **Tier 2 Administrator:** handles server, identity, permissions, and complex endpoint cases.
- **Service Desk Lead:** owns SLA, queue health, escalations, and quality review.

## 3. Required Fields
Requester, Department, Site, Device, Category, Subcategory, Impact, Urgency, Priority, Ticket Type, Assigned Group, Assignee, Status, Root Cause, Resolution Code, Time Spent, and Closure Summary.

## 4. Queues
- New and Unassigned
- Tier 1 Support
- Identity and Access
- Endpoint Support
- Microsoft 365
- Network and Remote Access
- Security Review
- Waiting on Requester
- Waiting on Vendor
- Escalated

## 5. Status Model
New → Open → Pending → On Hold → Solved → Closed.

## 6. Automation Rules
- Notify requester immediately after creation.
- Route password, MFA, and access requests to Identity and Access.
- Escalate Priority 1 after 15 minutes without acknowledgment.
- Remind pending requesters after two business days.
- Auto-close solved tickets after three business days without reply.
- Flag tickets missing root-cause or verification notes.

## 7. Quality Standard
A solved ticket must explain what failed, what was checked, what fixed it, how success was verified, and what the user should do if the problem returns.
