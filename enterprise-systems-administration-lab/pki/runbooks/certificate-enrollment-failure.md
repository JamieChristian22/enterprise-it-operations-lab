# Runbook: Certificate Enrollment Failure

1. Confirm template name and enrollment method.
2. Confirm CA availability.
3. Confirm user or computer permissions on the template.
4. Review Event Viewer certificate enrollment logs.
5. Confirm Group Policy applied.
6. Check DNS and RPC connectivity.
7. Run `certutil -pulse`.
8. Validate successful enrollment and chain.
