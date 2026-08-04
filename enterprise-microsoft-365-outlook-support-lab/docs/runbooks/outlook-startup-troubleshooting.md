# Runbook: Outlook Will Not Open

## Purpose
Provide a repeatable, least-disruptive workflow for Microsoft Outlook startup failures on Windows 11.

## Safety Rules
- Verify the requester before account or authentication changes.
- Do not delete profiles or credentials without approval and backup.
- Do not expose event-log data publicly without review.
- Use fictional or redacted data in portfolio evidence.
- Start with nondestructive diagnostics.

## Procedure

### Step 1 - Confirm Scope
Collect:
- Exact error or behavior
- First occurrence time
- Recent changes
- Whether Outlook Web works
- Whether Teams and other Office apps work
- Whether the issue affects one or multiple users
- Business impact

### Step 2 - Check Microsoft 365
Verify:
- Account active
- Sign-in allowed
- License assigned
- Exchange mailbox provisioned
- Service health clear
- No broad outage

**Stop and escalate** if multiple users are affected or service health reports an incident.

### Step 3 - Check Task Manager
1. Open Task Manager.
2. Search for Outlook.
3. Note CPU, memory, status, and process count.
4. End only clearly orphaned Outlook processes.
5. Retry Outlook.

### Step 4 - Review Event Viewer
1. Open Event Viewer.
2. Navigate to Windows Logs > Application.
3. Filter around the failure time.
4. Record Outlook/Application Error events.
5. Capture Event ID, module, exception code, and timestamp.

### Step 5 - Test Safe Mode
Run:

```cmd
outlook.exe /safe
```

- If Safe Mode works, inspect add-ins and local application components.
- If Safe Mode also fails, proceed to repair and consider profile or system-level causes.

### Step 6 - Disable Suspect Add-ins
Only when Safe Mode works and an add-in is suspected:
1. File > Options > Add-ins.
2. Manage COM Add-ins.
3. Disable nonessential third-party add-ins.
4. Test normal launch.
5. Re-enable one at a time if needed.

### Step 7 - Repair Microsoft 365 Apps
1. Confirm no Office application is open.
2. Launch Apps & Features or SaRA.
3. Select Microsoft 365 Apps.
4. Run Quick Repair.
5. Reboot only if prompted.
6. Test normal Outlook launch.

### Step 8 - Escalate to Online Repair
Use Online Repair when:
- Quick Repair fails.
- Multiple Office applications fail.
- Event errors persist.
- Component registration remains damaged.

### Step 9 - Verify
Confirm:
- Normal launch
- Microsoft 365 connection
- Inbox sync
- Send and receive
- Calendar
- Search
- Teams integration
- No new critical Outlook error

### Step 10 - Document and Close
Record:
- Root cause
- Evidence
- Repair
- Verification
- Customer confirmation
- Prevention
- Escalation reason if unresolved

## Decision Tree

```text
Outlook fails
 |
 +-- Web Outlook also fails? -- Yes --> Check account/service/identity
 |                             No
 |
 +-- Tenant incident? -------- Yes --> Communicate outage and monitor
 |                             No
 |
 +-- Orphaned process? ------- Yes --> End process and retest
 |                             No
 |
 +-- Safe Mode works? -------- Yes --> Check add-ins/components
 |                             No
 |
 +-- Quick Repair works? ----- Yes --> Verify and close
 |                             No
 |
 +-- Online Repair works? ---- Yes --> Verify and close
                               No --> Escalate
```
