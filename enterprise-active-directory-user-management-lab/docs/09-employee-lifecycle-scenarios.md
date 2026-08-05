# Employee Lifecycle Scenarios

This document demonstrates five identity lifecycle events under Northstar Logistics Group change-control standards.

## 1. New Hire — NLG1076 Maya Thompson
HR submits approved intake three business days before start. IT creates the account disabled, assigns department and baseline groups, creates the home folder, validates the manager, and enables the account only after the start-date check. The employee must change the temporary password at first sign-in.

## 2. Department Transfer — NLG1034 Jordan Reed
Jordan moves from Operations to Finance. IT records existing memberships, removes Operations role access, changes the department OU and attributes, adds Finance role access, validates mapped drives, and confirms the former share is denied. Access overlap is limited to the approved transition window.

## 3. Promotion — NLG1062 Taylor Walker
Taylor becomes Sales Operations Lead. Standard Sales access remains; the approved lead role is added through a global role group. No direct NTFS permissions are granted. Manager approval and ticket evidence are retained.

## 4. Leave of Absence — NLG1020 Riley Hughes
The account is disabled but not deleted, interactive sign-in is blocked, group membership is preserved unless HR requests otherwise, and the account is moved to the Leave OU. A dated description records the case and review date.

## 5. Termination and Rehire — NLG1048 Casey Patel
Offboarding disables the account, removes nonbaseline access, exports group membership, moves it to Disabled Users, and preserves the home folder. For rehire, IT verifies identity with HR, reviews old access rather than restoring it blindly, assigns a new temporary password, and documents every reactivated entitlement.

## Control Principles

- HR or the employee's manager is the system of record for lifecycle approval.
- Help Desk technicians execute only approved, documented access.
- Old access is removed before new access is granted during transfers.
- Direct user-to-folder permissions are prohibited.
- Every lifecycle action produces a ticket, log entry, and validation result.
