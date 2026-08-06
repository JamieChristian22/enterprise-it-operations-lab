# INC-003 — New Employee Missing Finance Team

**Severity:** Medium

## Cause
The onboarding request included the Finance security group but omitted the Microsoft 365 Group backing the Finance Team.

## Resolution
The user was added to the correct Team and the role template was updated.

## Validation
The Team appeared in the web and desktop clients, channels loaded, and SharePoint files were accessible.

## Prevention
Added Team and SharePoint checks to onboarding validation.
