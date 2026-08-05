# Interview Walkthrough

## 60-Second Project Explanation

“I built a Windows Server 2022 Active Directory environment for a fictional 75-user logistics company. I designed departmental OUs, created users and role-based groups, applied an AGDLP-style permission model to shared folders, implemented Group Policy baselines, and wrote PowerShell scripts for onboarding, password resets, group changes, offboarding, validation, and auditing. I also documented fifteen realistic tickets, support runbooks, security controls, rollback steps, and knowledge-base articles. The main goal was to show that I can administer identity safely, troubleshoot access issues, and communicate the work clearly.”

## Likely Questions

### Why use groups instead of direct permissions?

Groups simplify administration, support least privilege, create an auditable access model, and reduce inconsistent ACLs. A role change becomes a group change instead of a folder-by-folder permission change.

### What happens during offboarding?

I export the current state, disable the account, reset the password, remove nonessential groups, preserve required ownership records, move the account to a disabled OU, and record the ticket and date. I do not immediately delete the account because retention, legal hold, or data transfer may still be required.

### How do you handle a password reset safely?

I verify identity, inspect the account state, reset to a temporary password, require change at next sign-in, unlock only when appropriate, avoid writing the password in the ticket, and investigate repeated lockouts.

### What is the difference between share and NTFS permissions?

Both apply over SMB, and the most restrictive effective combination wins. In this lab, share permissions are broad enough for the approved resource group while NTFS provides the detailed control. Permissions are assigned to domain-local groups.

### How did you make automation safer?

I added strict mode, input validation, duplicate checks, terminating errors, logging, `ShouldProcess`/`-WhatIf`, confirmation for destructive actions, and state exports before offboarding changes.

## Demonstration Flow

1. Show the architecture.
2. Explain the OU and group model.
3. Walk through onboarding.
4. Show the permission matrix.
5. Explain one password-reset ticket.
6. Explain one denied-access troubleshooting ticket.
7. Show offboarding evidence.
8. Close with validation and audit reports.
