# INC-260703: VPN fails with authentication error

## Ticket Record

| Field | Value |
|---|---|
| Requester | Morgan Reed |
| Department | Executive |
| Device | LAP-EXE-002 |
| Type | Incident |
| Priority | P2 |
| Assigned Queue | Network and Remote Access |
| Assigned Agent | Jamie Christian |
| Opened | 2026-07-03 09:21 |
| Status | Solved |
| Time Spent | 67 minutes |
| SLA | Met |

## User-Reported Problem
The requester reported **vpn fails with authentication error**. The issue affected normal work and required service-desk assistance. The user confirmed the affected device and described the last successful use.

## Business Impact
The impact was limited to executive operations. Priority was assigned using the documented impact-versus-urgency matrix.

## Troubleshooting Performed
1. Verified the requester's identity and confirmed the affected device.
2. Asked when the issue began and whether any password, software, hardware, or network changes occurred.
3. Reproduced or validated the reported symptom.
4. Checked relevant Windows, Microsoft 365, network, account, or device settings.
5. Reviewed logs, service status, configuration, and known-error documentation.
6. Applied the least disruptive corrective action and recorded the result.
7. Re-tested the original workflow with the requester.

## Root Cause
Expired cached password in VPN client.

## Resolution
Updated stored credential, reauthenticated MFA, verified access to internal share.

## Verification
The requester repeated the original task successfully. No error recurred during the verification period, and related services remained operational.

## Internal Closure Note
Resolved by Jamie Christian. Root cause and corrective action were documented. The requester received prevention guidance and was advised to reopen the ticket if symptoms return.

## User Closure Message
Hello Morgan Reed, your issue has been resolved. I verified the fix with you and confirmed that the affected workflow is functioning normally. Please reply to this ticket if the problem returns.
