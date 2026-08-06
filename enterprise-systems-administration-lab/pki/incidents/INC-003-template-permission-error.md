# INC-003 — Computer Auto-Enrollment Failed

## Cause
Domain Computers lacked Enroll and Autoenroll permissions on the new template.

## Resolution
Template ACLs were corrected and `certutil -pulse` triggered enrollment.

## Validation
The device received a certificate with the expected EKUs.
