# Account Lockout Response

1. Verify the caller using two approved identity attributes.
2. Run `Search-ADAccount -LockedOut` and inspect `LockedOut`, `BadPwdCount`, and `LastBadPasswordAttempt`.
3. Check DC Security event 4740 and identify `Caller Computer Name`.
4. Inspect stored credentials, mapped drives, services, scheduled tasks, mobile mail profiles, and disconnected RDP sessions on the source device.
5. Remove the stale credential source.
6. Unlock with `Unlock-ADAccount` and require password reset only when compromise or forgotten credentials are suspected.
7. Confirm successful sign-in and no repeated 4740 event for 15 minutes.
8. Document root cause, source host, action, and validation.
