# Security Baseline
- MFA for all human administrators
- No long-lived root credentials
- Least-privilege roles and quarterly access reviews
- IMDSv2 required on EC2
- Encryption at rest for EBS, RDS, logs, backups, and Key Vault
- Private application and database subnets
- Public access blocked on S3
- Centralized audit logging and 30-day operational log retention
- Critical patches within 14 days and high-severity patches within 30 days
