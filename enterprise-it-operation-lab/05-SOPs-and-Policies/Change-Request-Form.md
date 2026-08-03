# Change Request CR-2026-014

- **Title:** Reserve static printer addresses
- **Requested By:** Jamie Christian
- **Business Reason:** Prevent printer-port failures after DHCP changes
- **Scope:** Six network printers
- **Risk:** Low
- **Implementation:** Create DHCP reservations, update documentation, validate print queues
- **Validation:** Print test pages from each department
- **Rollback:** Remove reservations and restore previous addresses
- **Window:** 2026-07-25 18:00–19:00
- **Approval:** Service Desk Lead
- **Result:** Successful; no user impact
