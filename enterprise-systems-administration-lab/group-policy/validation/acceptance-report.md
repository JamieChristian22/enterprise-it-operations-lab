# Pilot Acceptance Report

**Change window:** August 5, 2026, 18:00–20:00 EDT  
**Pilot endpoint:** `NS-WKS-PILOT01`  
**Pilot user:** `CORP\gpo.pilot`  
**Executed by:** Jamie Christian  

## Results

All ten test cases passed. The workstation received the intended computer and user policies, firewall and Defender remained active, PowerShell audit events were generated, and the Windows Update configuration appeared in the policy registry path. Security filtering prevented the Help Desk GPO from applying to the standard pilot user. Kiosk loopback was separately validated on `NS-KIOSK-01`.

## User impact

No sign-in delay, networking failure, application launch issue, or unexpected restart occurred. The 15-minute screen lock matched the approved security requirement.

## Decision

Approved for staged deployment to the Standard Workstations OU. Continue monitoring Group Policy operational events and Service Desk incidents during the first business day after rollout.
