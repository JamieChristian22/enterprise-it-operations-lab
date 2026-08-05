# Authoritative Object Restore Procedure

1. Confirm deletion scope, business owner, and restore authorization.
2. Prefer AD Recycle Bin for recoverable objects.
3. If System State restore is required, isolate the recovery workflow and boot the selected DC into Directory Services Restore Mode.
4. Perform System State restore and mark only required objects authoritative with `ntdsutil`.
5. Restart, allow replication, validate object attributes and memberships, and monitor Directory Service logs.
6. Document RTO, recovered objects, validation, and lessons learned.

This lab procedure is documented and tabletop-tested; no claim is made that a production restore occurred.
