# Test Matrix

| ID | Test | Expected | Result |
|---|---|---|---|
| TC-001 | Create standard user | Approved user created in correct OU | PASS |
| TC-002 | Duplicate username prevention | Creation blocked and alternate generated | PASS |
| TC-003 | Password reset | Temporary password set; force change enabled | PASS |
| TC-004 | Account unlock | LockedOut becomes False | PASS |
| TC-005 | Department transfer | OU, attributes, and groups updated | PASS |
| TC-006 | Offboarding | Account disabled; access removed | PASS |
| TC-007 | AGDLP department access | Authorized share access allowed | PASS |
| TC-008 | Cross-department access | Unauthorized access denied | PASS |
| TC-009 | Help Desk reset delegation | Allowed | PASS |
| TC-010 | Help Desk Domain Admin modification | Denied | PASS |
| TC-011 | GPO workstation baseline | Expected policy applied | PASS |
| TC-012 | GPO rollback | Settings removed after unlink | PASS |
| TC-013 | GPO backup | Backup and metadata created | PASS |
| TC-014 | DNS SRV lookup | DC LDAP record returned | PASS |
| TC-015 | Domain health | No critical dcdiag errors | PASS |
