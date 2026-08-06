# Data Sanitization Standard

## Prohibited Content

- Passwords, API keys, tokens, private keys, and connection strings
- Real employee or customer personal information
- Public IP addresses tied to a real organization
- Proprietary screenshots or internal URLs
- Licensed software keys

## Sanitization Rules

- Use fictional names and domains.
- Replace sensitive identifiers with consistent lab values.
- Preserve timestamps, status, sequence, and technical meaning when sanitizing evidence.
- Review command output for usernames, paths, addresses, and secrets.
- Store only evidence necessary to demonstrate the task and result.

## Validation

Before publishing, perform a text search for common secret patterns and manually review screenshots and logs.
