# Knowledge Base Documentation Standard

## Required metadata
Every article must identify service, audience, severity, owner, author, environment, version, review date, and review cycle.

## Technical requirements
Procedures must include exact platform commands, expected decision points, validation, rollback, and escalation. Commands must be safe to copy only after the administrator verifies names, access, scope, and change approval.

## Evidence requirements
Attach the exact error, timestamp, affected object, relevant log events, command output, configuration before and after, and successful validation. Redact credentials, tokens, private keys, personal data, message content, and unrelated account information.

## Naming
Use `kb-NNN-descriptive-slug.md`. Article numbers remain permanent even when an article is retired.

## Change control
Service restarts, policy changes, access changes, certificate bindings, storage expansion, package upgrades, and production reboots require an approved ticket or change record.

## Review and lifecycle
Review each article every 180 days and after any major platform change or incident. Mark superseded articles as retired in `article-register.csv` rather than deleting historical references.
