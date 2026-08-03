# New CTSUser

## Purpose
Provides a repeatable, auditable method to perform **new ctsuser** in the CTS lab.

## Requirements
- Windows PowerShell 5.1 or newer
- Appropriate local or domain permissions
- ActiveDirectory module for identity scripts
- PowerShell remoting and firewall access for remote operations

## Usage
```powershell
Get-Help .\01-New-CTSUser.ps1 -Full
.\01-New-CTSUser.ps1 -WhatIf
```

## Expected Result
The script validates its inputs, performs or previews the requested operation, and writes a clear success or warning message. Reporting scripts save CSV output in `03-Automation/Reports`.

## Safety
Use `-WhatIf` when supported. Test against lab objects before using in another environment. Never place credentials inside the script.
