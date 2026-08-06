<#
.SYNOPSIS
Installs the approved role set for a named Northstar server role.
#>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [ValidateSet('DomainController','FileServer','PrintServer','ApplicationServer')]
    [string]$ServerRole
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$map = @{
    DomainController  = @('AD-Domain-Services','DNS')
    FileServer        = @('FS-FileServer','FS-Resource-Manager','Windows-Server-Backup')
    PrintServer       = @('Print-Server')
    ApplicationServer = @('Web-Server','Web-Mgmt-Tools')
}
$features = $map[$ServerRole]
foreach ($feature in $features) {
    $state = Get-WindowsFeature -Name $feature
    if (-not $state.Installed -and $PSCmdlet.ShouldProcess($env:COMPUTERNAME, "Install $feature")) {
        Install-WindowsFeature -Name $feature -IncludeManagementTools -ErrorAction Stop | Out-Null
    }
}
Get-WindowsFeature -Name $features | Select-Object Name, DisplayName, Installed, InstallState
