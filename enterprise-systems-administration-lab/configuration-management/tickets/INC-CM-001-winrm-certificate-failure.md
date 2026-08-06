# INC-CM-001 — WinRM Certificate Validation Failure

WEB02 was unreachable during check mode because its renewed WinRM certificate lacked the expected DNS subject. Deployment paused before changes. The certificate template was corrected, a new certificate was enrolled, the listener was rebound, and Kerberos/HTTPS validation passed. No production change occurred before resolution.
