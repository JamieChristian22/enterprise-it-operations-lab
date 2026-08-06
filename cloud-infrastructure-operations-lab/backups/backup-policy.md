# Backup Policy
RDS is backed up daily with 35-day retention. Azure VM backup runs daily with 30-day retention. Restore tests are performed monthly for critical services. A backup is not considered compliant until the job completes, the recovery point is within the RPO, and a scheduled restore test confirms usability.
