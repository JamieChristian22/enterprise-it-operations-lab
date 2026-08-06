# Incident Severity Matrix

## Severity Definitions

| Severity | Business impact | Example criteria | Acknowledgement target | Update cadence | Restoration target |
|---|---|---|---:|---:|---:|
| **SEV-1 Critical** | Enterprise-wide or customer-facing critical service unavailable; material security or safety impact | Authentication unavailable for most users; public portal unavailable; destructive security event | 5 min | 15 min | 2 hr |
| **SEV-2 High** | Major degradation or site/business-unit outage with no acceptable workaround | WAN degradation, mail-flow failure, shared storage unavailable, malware requiring broad containment | 10 min | 30 min | 4 hr |
| **SEV-3 Medium** | Limited users or non-critical service affected; workaround exists | Failed backup job, isolated application issue, printer or departmental share outage | 30 min | 60 min | 8 business hr |
| **SEV-4 Low** | Minimal operational impact; routine support | Single-user issue, cosmetic defect, informational alert | 4 business hr | As needed | 3 business days |

## Assignment Rules

Severity is based on the highest applicable factor:

| Factor | SEV-1 | SEV-2 | SEV-3 | SEV-4 |
|---|---|---|---|---|
| Users affected | More than 50% or external customers | 10–50% or entire site | 2–9% | One user |
| Criticality | Tier-0/Tier-1 service unavailable | Tier-1 degraded or Tier-2 unavailable | Tier-2 degraded | Tier-3 |
| Workaround | None | Partial or operationally expensive | Acceptable | Full |
| Data/security | Confirmed major compromise | Suspected compromise or contained malware | Low-risk alert | No security impact |
| Revenue/operations | Business stopped | Material delay | Limited delay | Negligible |

## Escalation

- **SEV-1:** Incident commander, technical lead, operations manager, service owner, communications lead, executive liaison.
- **SEV-2:** Incident commander, technical lead, service owner, service desk lead; vendor as required.
- **SEV-3:** Resolver group lead and service owner.
- **SEV-4:** Assigned technician.

The incident commander may raise or lower severity when verified scope, impact, or risk changes. Every change is time-stamped in the incident record.
