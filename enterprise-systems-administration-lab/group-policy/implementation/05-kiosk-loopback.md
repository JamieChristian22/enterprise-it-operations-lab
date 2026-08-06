# Kiosk Loopback Processing

## Design

Kiosk restrictions must follow the computer, regardless of which approved kiosk user signs in. Therefore, `CORP-KIOSK-Lockdown-v1.0` uses User Group Policy loopback processing in **Replace** mode.

## Procedure

1. Link the GPO only to the Kiosk computer OU.
2. Enable Computer Configuration → Administrative Templates → System → Group Policy → Configure user Group Policy loopback processing mode.
3. Select Replace.
4. Configure user-interface restrictions in the same GPO or a companion user-settings GPO linked to the Kiosk computer OU.
5. Validate with both a standard test user and the kiosk test user.

## Rollback

Unlink `CORP-KIOSK-Lockdown-v1.0`, run `gpupdate /force`, then sign out and sign in again. If emergency access is required, move the computer temporarily to the Pilot OU under approved change control.
