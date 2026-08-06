# Security and Compliance Administration

## Baseline Controls

- Require MFA for all users.
- Block legacy authentication.
- Require stronger controls for administrators.
- Protect emergency access accounts separately.
- Review risky sign-ins.
- Review administrator role assignments.
- Review guest users.
- Monitor mailbox forwarding.
- Use audit logging for investigation.
- Review security defaults or Conditional Access configuration.

## Conditional Access Policy Set

| Policy | Purpose |
|---|---|
| CA-001 Require MFA for All Users | Require MFA for cloud application access |
| CA-002 Block Legacy Authentication | Prevent basic authentication |
| CA-003 Require MFA for Administrators | Protect privileged roles |
| CA-004 Block Unsupported Countries | Restrict sign-ins based on approved business locations |
| CA-005 Require Compliant Device for Admin Portals | Protect administration interfaces |

Policies should be validated in report-only mode before enforcement.

## Investigation Sources

- Entra sign-in logs
- Audit logs
- Risky users and risky sign-ins
- Exchange message trace
- Unified audit log
- Quarantine
- Mailbox audit events
- Microsoft 365 service health
