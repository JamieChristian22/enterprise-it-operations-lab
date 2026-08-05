# Change Risk Assessment Matrix

## Scoring Model

Each factor is scored from 1 to 5.

| Score | Meaning |
|---:|---|
| 1 | Minimal |
| 2 | Low |
| 3 | Moderate |
| 4 | High |
| 5 | Severe |

## Assessment Factors

### Likelihood of Failure

| Score | Criteria |
|---:|---|
| 1 | Previously completed successfully more than five times |
| 2 | Proven process with minor environment variation |
| 3 | Some uncertainty or limited prior execution |
| 4 | Complex or first-time change |
| 5 | Unproven design or known instability |

### User Impact

| Score | Criteria |
|---:|---|
| 1 | No user-visible impact |
| 2 | Fewer than 10 users; workaround available |
| 3 | One department or limited service degradation |
| 4 | Multiple departments or material outage |
| 5 | Organization-wide critical service outage |

### Service Criticality

| Score | Criteria |
|---:|---|
| 1 | Noncritical internal tool |
| 2 | Low-priority support function |
| 3 | Important business service |
| 4 | Business-critical service |
| 5 | Safety, revenue, identity, or organization-wide dependency |

### Rollback Complexity

| Score | Criteria |
|---:|---|
| 1 | Single-step reversal under 10 minutes |
| 2 | Documented reversal under 30 minutes |
| 3 | Multi-step reversal under one hour |
| 4 | Restore or rebuild required |
| 5 | Rollback uncertain or potentially destructive |

### Security Exposure

| Score | Criteria |
|---:|---|
| 1 | No access or security effect |
| 2 | Minor endpoint or configuration effect |
| 3 | Access-control or authentication impact |
| 4 | Privileged access, security boundary, or logging impact |
| 5 | Material exposure of identities, data, or core controls |

## Classification

| Total Score | Classification | Required Governance |
|---:|---|---|
| 5–8 | Low | Change Manager approval |
| 9–13 | Moderate | Change Manager and Service Owner |
| 14–18 | High | CAB and Security review |
| 19–25 | Critical | Executive Service Owner and CAB Chair |

## Escalation Rules

A change is automatically treated as High or Critical when it:

- Alters privileged access
- Disables a security control
- Affects identity or authentication for most users
- Has no tested rollback
- Requires downtime outside the approved window
- Modifies a business-critical service
