# CRQ-2026-014 — Domain Password Policy Update

## Business Justification

Increase minimum password length from 10 to 14 characters to meet the revised identity security baseline.

## Scope

The default domain password policy for corp.example and all users governed by that policy.

## Risk

Moderate. Authentication is business critical, but rollback is a single documented policy reversal.

## Implementation

The current policy was exported, Group Policy health was verified, the revised policy was applied, policy refresh was completed, and compliant and noncompliant passwords were tested.

## Validation

- Minimum length displayed as 14
- Compliant password accepted
- Ten-character password rejected
- Existing users authenticated normally

## Rollback

Restore the prior 10-character policy and validate authentication.

## Outcome

Implemented successfully on 2026-07-10 with no rollback.
