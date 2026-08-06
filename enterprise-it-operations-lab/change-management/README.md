# 🔄 Enterprise Change Management Lab

![ITIL](https://img.shields.io/badge/ITIL-Change%20Enablement-6A5ACD?style=for-the-badge)
![CAB](https://img.shields.io/badge/CAB-Governance-0052CC?style=for-the-badge)
![Risk](https://img.shields.io/badge/Risk-Scoring-orange?style=for-the-badge)
![Audit](https://img.shields.io/badge/Audit-Ready-success?style=for-the-badge)

A production-style change-management portfolio project covering governance, change classification, risk assessment, approval, scheduling, implementation, validation, rollback, emergency changes, failed changes, post-implementation review, reporting, and audit evidence.

## Business Scenario

Northstar Services operates Windows, Linux, Microsoft 365, AWS, Active Directory, networking, monitoring, backup, and security services. Changes must be assessed, approved, scheduled, implemented, validated, and documented to reduce service disruption and operational risk.

## Change Types

- **Standard:** Pre-approved, low-risk, repeatable
- **Normal:** Requires assessment and approval
- **Emergency:** Expedited to resolve or prevent major impact
- **Failed:** Change that required rollback or caused unplanned impact

## Core Controls

- Risk scoring
- Separation of duties
- CAB review
- Backout planning
- Maintenance windows
- Conflict checks
- Stakeholder communications
- Pre- and post-change validation
- Post-implementation review
- Metrics and audit evidence

## Repository Structure

```text
enterprise-change-management-lab/
├── calendar/
├── changes/
│   ├── emergency/
│   ├── failed/
│   ├── normal/
│   └── standard/
├── configuration/
├── evidence/
├── governance/
├── policies/
├── reports/
├── runbooks/
├── templates/
└── tests/
```

## Demonstrated Skills

- Classify and score changes
- Build implementation and rollback plans
- Facilitate CAB review
- Manage maintenance windows and blackout periods
- Handle emergency and failed changes
- Conduct post-implementation reviews
- Report change success, rollback, and incident impact
- Maintain audit-ready evidence
