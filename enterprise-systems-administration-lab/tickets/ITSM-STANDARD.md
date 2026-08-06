# ITSM Ticket Documentation Standard

## Required Quality

Every ticket must state what failed, who or what was affected, how severity was determined, what evidence was collected, what caused the issue, what changed, how recovery was verified, and who confirmed success.

## Priority Model

- **P1:** Critical production outage, major security event, or broad business interruption.
- **P2:** Significant degradation or departmental impact with limited workaround.
- **P3:** Standard incident affecting a limited user or noncritical workflow.
- **P4:** Low-impact request or cosmetic issue. P4 was not used in this incident portfolio.

## Documentation Rules

1. Use exact timestamps in Eastern Time.
2. Record commands and summarize their meaningful results.
3. Separate symptoms from root cause.
4. Never store passwords, tokens, private keys, or unredacted personal data.
5. Document approval and rollback readiness for material changes.
6. Validate from the user's perspective and the infrastructure perspective.
7. Link repeatable resolutions to a knowledge article.
8. Close only after service restoration and confirmation.

## Closure Criteria

A ticket is resolved only when the failure can no longer be reproduced, dependent services are healthy, logs show no repeat errors, monitoring is normal, the requester or service owner has confirmed recovery, and all evidence is attached or referenced.
