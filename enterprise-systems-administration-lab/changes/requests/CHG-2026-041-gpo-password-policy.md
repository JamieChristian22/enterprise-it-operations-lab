# CHG-2026-041 — Deploy Updated Domain Password Policy

- Type: Normal
- Risk: High (Impact 4 × Likelihood 3 = 12)
- Status: Successful
- Window: August 4, 2026, 10:00–11:00 PM ET
- Implementer: Jamie Christian, Systems Administrator
- Approvals: AD Service Owner, Security Analyst, CAB Chair

## Objective
Increase minimum password length from 12 to 14 characters and block legacy reversible encryption.

## Testing
Validated in `OU=Pilot,OU=Users,DC=corp,DC=northstar,DC=local` with three test accounts and successful sign-in/reset tests.

## Implementation
1. Backed up Default Domain Policy.
2. Updated password settings in a dedicated domain policy GPO.
3. Confirmed link order and enforced inheritance behavior.
4. Ran `gpupdate /force` on pilot clients.
5. Expanded scope after validation.

## Validation
`gpresult` confirmed the policy. New passwords below 14 characters were rejected. Existing users authenticated successfully.

## Rollback
Restore prior GPO backup and unlink the new policy.

## Outcome
Completed in 31 minutes with no authentication incidents.
