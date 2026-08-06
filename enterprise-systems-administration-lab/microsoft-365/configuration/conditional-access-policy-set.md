# Conditional Access Policy Set

## CA-001 — Require MFA for All Users

- Users: All users
- Exclusions: Two monitored emergency access accounts
- Resources: All cloud apps
- Grant: Require multifactor authentication
- Deployment: Report-only, pilot, then enabled

## CA-002 — Block Legacy Authentication

- Users: All users
- Client apps: Exchange ActiveSync and other legacy clients
- Grant: Block access

## CA-003 — Protect Administrator Roles

- Users: Directory roles
- Resources: Microsoft admin portals
- Grant: Require MFA
- Session: Sign-in frequency based on risk and organizational policy

## Validation

- Test with pilot users.
- Review report-only results.
- Confirm emergency access account behavior.
- Record successful and blocked test cases.
