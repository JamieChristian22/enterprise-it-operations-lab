<#
.SYNOPSIS
Creates a non-destructive Outlook support bundle.

.DESCRIPTION
Collects operating-system information, Outlook process state, Microsoft 365
connectivity results, Office executable versions, and relevant Application
events. The script does not modify Outlook, Office, profiles, credentials,
registry values, or mailbox data.

.PARAMETER OutputDirectory
Parent directory for the timestamped support bundle.

.PARAMETER EventHoursBack
Number of hours of Application events to inspect.

.EXAMPLE
.\Invoke-OutlookSupportBundle.ps1 -OutputDirectory C:\Temp -EventHoursBack 48

.NOTES
Author: Jamie Christian
Version: 1.0.0
#>

[CmdletBinding()]
param(
    [ValidateNotNullOrEmpty()]
    [string]$OutputDirectory = "$env:USERPROFILE\Desktop",

    [ValidateRange(1, 720)]
    [int]$EventHoursBack = 24
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$modulePath = Join-Path $PSScriptRoot "modules\Support.Common.psm1"
if (-not (Test-Path $modulePath)) {
    throw "Required module not found: $modulePath"
}

Import-Module $modulePath -Force

$bundle = New-SupportOutputDirectory -BasePath $OutputDirectory -Prefix "OutlookSupportBundle"
$logPath = Join-Path $bundle "bundle.log"

function Export-Safely {
    param(
        [Parameter(Mandatory)][scriptblock]$Action,
        [Parameter(Mandatory)][string]$Name
    )

    try {
        & $Action
        Write-SupportLog -Message "$Name completed." -Level SUCCESS -LogPath $logPath
        return $true
    }
    catch {
        Write-SupportLog -Message "$Name failed: $($_.Exception.Message)" -Level WARN -LogPath $logPath
        return $false
    }
}

Write-SupportLog -Message "Starting Outlook support bundle." -LogPath $logPath

$results = [ordered]@{}

$results.SystemInformation = Export-Safely -Name "System information" -Action {
    Get-ComputerInfo |
        Select-Object CsName, CsManufacturer, CsModel, WindowsProductName,
        WindowsVersion, OsBuildNumber, OsLastBootUpTime |
        ConvertTo-Json -Depth 3 |
        Out-File (Join-Path $bundle "system-information.json") -Encoding utf8
}

$results.OutlookProcesses = Export-Safely -Name "Outlook process collection" -Action {
    $processes = Get-Process OUTLOOK -ErrorAction SilentlyContinue |
        Select-Object Name, Id, CPU, WorkingSet64, StartTime, Responding

    if ($processes) {
        $processes | Export-Csv (Join-Path $bundle "outlook-processes.csv") -NoTypeInformation -Encoding utf8
    }
    else {
        [pscustomobject]@{
            Name = "OUTLOOK"
            Id = $null
            Status = "Not running"
            Timestamp = Get-Date
        } | Export-Csv (Join-Path $bundle "outlook-processes.csv") -NoTypeInformation -Encoding utf8
    }
}

$results.OfficeVersions = Export-Safely -Name "Office version collection" -Action {
    $paths = @(
        "$env:ProgramFiles\Microsoft Office\root\Office16\OUTLOOK.EXE",
        "${env:ProgramFiles(x86)}\Microsoft Office\root\Office16\OUTLOOK.EXE"
    ) | Where-Object { $_ -and (Test-Path $_) }

    $versions = foreach ($path in $paths) {
        $item = Get-Item $path
        [pscustomobject]@{
            Path = $path
            ProductVersion = $item.VersionInfo.ProductVersion
            FileVersion = $item.VersionInfo.FileVersion
        }
    }

    $versions | Export-Csv (Join-Path $bundle "office-versions.csv") -NoTypeInformation -Encoding utf8
}

$results.Events = Export-Safely -Name "Application event collection" -Action {
    $start = (Get-Date).AddHours(-$EventHoursBack)
    Get-WinEvent -FilterHashtable @{
        LogName = "Application"
        StartTime = $start
        Level = 1,2,3
    } -ErrorAction Stop |
        Where-Object {
            $_.ProviderName -match "Outlook|Application Error|Office|Windows Error Reporting" -or
            $_.Message -match "OUTLOOK\.EXE|Microsoft Outlook"
        } |
        Select-Object TimeCreated, Id, LevelDisplayName, ProviderName, MachineName, Message |
        Export-Csv (Join-Path $bundle "outlook-events.csv") -NoTypeInformation -Encoding utf8
}

$results.Connectivity = Export-Safely -Name "Microsoft 365 connectivity tests" -Action {
    $targets = "outlook.office365.com", "login.microsoftonline.com", "office.com"
    $tests = foreach ($target in $targets) {
        $dns = $null
        try {
            $dns = Resolve-DnsName $target -ErrorAction Stop |
                Where-Object IPAddress |
                Select-Object -ExpandProperty IPAddress -Unique
        } catch {}

        $tcp = Test-NetConnection $target -Port 443 -WarningAction SilentlyContinue

        [pscustomobject]@{
            Timestamp = Get-Date
            Target = $target
            DnsResolved = [bool]$dns
            IPAddresses = ($dns -join ";")
            Tcp443Success = [bool]$tcp.TcpTestSucceeded
            RemoteAddress = $tcp.RemoteAddress
            InterfaceAlias = $tcp.InterfaceAlias
        }
    }

    $tests | Export-Csv (Join-Path $bundle "m365-connectivity.csv") -NoTypeInformation -Encoding utf8
}

[pscustomobject]$results |
    ConvertTo-Json -Depth 4 |
    Out-File (Join-Path $bundle "collection-status.json") -Encoding utf8

Write-SupportLog -Message "Support bundle completed: $bundle" -Level SUCCESS -LogPath $logPath
Write-Output $bundle
