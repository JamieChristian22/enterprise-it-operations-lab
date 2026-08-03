# Directory Security Policies

## Password Policy
- Minimum length: 14 characters
- Complexity: enabled
- Password history: 24
- Minimum age: 1 day
- Maximum age: 90 days
- Reversible encryption: disabled

## Account Lockout
- Threshold: 10 failed attempts
- Lockout duration: 15 minutes
- Counter reset: 15 minutes

## Administrative Controls
- Separate standard and privileged accounts
- No shared administrator accounts
- MFA required for administrative portals
- Service accounts denied interactive logon
- Quarterly group-membership review
- Disabled accounts moved to CTS-Disabled-Objects
