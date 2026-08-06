# Test Execution

Install Pester 5 or later and run:

```powershell
Install-Module Pester -Scope CurrentUser -MinimumVersion 5.0 -Force
Invoke-Pester .\tests -Output Detailed
```

The suite validates repository completeness, PowerShell parsing, comment-based help, inventory integrity, and group-based permission design. Live infrastructure checks are performed by the scripts in `powershell/` because they require Windows Server and administrative access.
