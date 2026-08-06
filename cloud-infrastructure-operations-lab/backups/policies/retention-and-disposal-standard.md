# Retention and Secure Disposal Standard

Recovery points are retained according to service tier and legal requirements. Deletion occurs only after the retention period expires, an approved legal hold is cleared, and automated lifecycle rules confirm that no active recovery test or incident depends on the recovery point.

## Controls

- AWS Backup Vault Lock uses compliance mode for long-term Tier 0 and Tier 1 copies.
- Azure Recovery Services Vault uses soft delete and multi-user authorization where supported.
- Backup encryption keys are protected from deletion through key-policy separation and deletion waiting periods.
- Manual deletion requests require a change record and independent approval.
- Recovery points under investigation or legal hold are tagged `Hold=true` and excluded from lifecycle expiration.
- Disposal logs record resource, recovery point, deletion time, initiating identity, approval reference, and outcome.

## Minimum deletion evidence

A compliant deletion record must demonstrate authorization, expired retention, absence of legal hold, key availability through the deletion window, and successful audit-log capture.
