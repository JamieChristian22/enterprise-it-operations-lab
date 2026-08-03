# Active Directory Build and Validation Guide

1. Install Windows Server 2022 in a virtual machine with a static IP.
2. Rename the server `DC01` and install AD DS and DNS.
3. Create the forest `cts-lab.local`.
4. Create the OU structure documented in `OU-DESIGN.md`.
5. Create groups from `Data/groups.csv`.
6. Import users from `Data/users.csv` using the automation script.
7. Apply password and account-lockout settings.
8. Create department shares and assign NTFS permissions to groups.
9. Join a Windows 11 workstation to the domain.
10. Test sign-in, password reset, lockout, group access, mapped drives, and disabled-account behavior.

## Validation Results
- DNS resolves `dc01.cts-lab.local`.
- Domain users can sign in to the Windows 11 client.
- Unauthorized users are denied access to department shares.
- Disabled users cannot authenticate.
- Group membership refreshes after sign-out/sign-in or `gpupdate /force`.
