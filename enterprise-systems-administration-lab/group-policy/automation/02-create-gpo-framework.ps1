#requires -Modules ActiveDirectory, GroupPolicy
[CmdletBinding(SupportsShouldProcess, ConfirmImpact='High')]
param(
    [string]$Domain = 'corp.northstar.local'
)
$ErrorActionPreference = 'Stop'

$definitions = @(
    @{ Name='CORP-DOM-Account-Policy-v1.0'; Comment='Domain account policy. Owner: Infrastructure. Change: CHG-2026-081.' },
    @{ Name='CORP-WS-Security-Baseline-v1.0'; Comment='Windows workstation security baseline. Owner: Security. Change: CHG-2026-082.' },
    @{ Name='CORP-WS-Audit-Logging-v1.0'; Comment='Advanced auditing and PowerShell logging. Owner: Security. Change: CHG-2026-083.' },
    @{ Name='CORP-WS-Windows-Update-v1.0'; Comment='Managed Windows Update policy. Owner: Infrastructure. Change: CHG-2026-084.' },
    @{ Name='CORP-USR-Session-Security-v1.0'; Comment='User inactivity and screen lock policy. Owner: Security. Change: CHG-2026-085.' },
    @{ Name='CORP-HD-Admin-Tools-v1.0'; Comment='Help Desk administrative tooling and scoped controls. Owner: Infrastructure. Change: CHG-2026-086.' },
    @{ Name='CORP-KIOSK-Lockdown-v1.0'; Comment='Kiosk loopback and user-interface lockdown. Owner: Operations. Change: CHG-2026-087.' },
    @{ Name='CORP-PILOT-Validation-v1.0'; Comment='Temporary validation policy for pilot endpoints. Owner: Infrastructure. Change: CHG-2026-088.' }
)

foreach ($definition in $definitions) {
    $existing = Get-GPO -Name $definition.Name -Domain $Domain -ErrorAction SilentlyContinue
    if ($existing) {
        Write-Verbose "GPO already exists: $($definition.Name)"
        continue
    }
    if ($PSCmdlet.ShouldProcess($definition.Name, 'Create GPO')) {
        New-GPO -Name $definition.Name -Comment $definition.Comment -Domain $Domain | Out-Null
        Write-Host "Created $($definition.Name)" -ForegroundColor Green
    }
}
