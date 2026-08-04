[CmdletBinding()]
param(
    [int]$EventHoursBack = 24,
    [string]$OutputDirectory = "$env:USERPROFILE\Desktop"
)

$ErrorActionPreference = "Stop"
Import-Module (Join-Path $PSScriptRoot "modules\Support.Common.psm1") -Force

$outDir = New-SupportOutputDirectory -BasePath $OutputDirectory -Prefix "OutlookDiagnostics"
$log = Join-Path $outDir "run.log"
$summary = Join-Path $outDir "diagnostic-summary.txt"

try {
    Write-SupportLog -Message "Starting Outlook diagnostic collection." -LogPath $log

    $os = Get-CimInstance Win32_OperatingSystem
    $computer = Get-CimInstance Win32_ComputerSystem
    $outlookProcesses = Get-Process OUTLOOK -ErrorAction SilentlyContinue
    $officePaths = @(
        "$env:ProgramFiles\Microsoft Office\root\Office16\OUTLOOK.EXE",
        "${env:ProgramFiles(x86)}\Microsoft Office\root\Office16\OUTLOOK.EXE"
    ) | Where-Object { $_ -and (Test-Path $_) }

    $officeVersion = foreach ($path in $officePaths) {
        $item = Get-Item $path
        [pscustomobject]@{
            Path           = $path
            ProductVersion = $item.VersionInfo.ProductVersion
            FileVersion    = $item.VersionInfo.FileVersion
        }
    }

    $start = (Get-Date).AddHours(-1 * [math]::Abs($EventHoursBack))
    $events = Get-WinEvent -FilterHashtable @{
        LogName   = "Application"
        StartTime = $start
        Level     = 1, 2, 3
    } -ErrorAction SilentlyContinue |
    Where-Object {
        $_.ProviderName -match "Outlook|Application Error|Office|Windows Error Reporting" -or
        $_.Message -match "OUTLOOK\.EXE|Microsoft Outlook"
    }

    @"
Outlook Diagnostic Summary
Generated: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")

Computer: $($computer.Name)
Manufacturer: $($computer.Manufacturer)
Model: $($computer.Model)
OS: $($os.Caption)
OS Version: $($os.Version)
Last Boot: $($os.LastBootUpTime)

Outlook Processes: $(@($outlookProcesses).Count)
Relevant Application Events ($EventHoursBack hours): $(@($events).Count)
Office Executables Found: $(@($officeVersion).Count)
"@ | Out-File -FilePath $summary -Encoding utf8

    $officeVersion | Export-Csv (Join-Path $outDir "office-version.csv") -NoTypeInformation -Encoding utf8
    $outlookProcesses |
        Select-Object Name, Id, CPU, WorkingSet64, StartTime, Responding |
        Export-Csv (Join-Path $outDir "outlook-processes.csv") -NoTypeInformation -Encoding utf8

    $events |
        Select-Object TimeCreated, Id, LevelDisplayName, ProviderName, Message |
        Export-Csv (Join-Path $outDir "outlook-events.csv") -NoTypeInformation -Encoding utf8

    Write-SupportLog -Message "Diagnostic bundle created at $outDir" -Level SUCCESS -LogPath $log
}
catch {
    Write-SupportLog -Message $_.Exception.Message -Level ERROR -LogPath $log
    exit 1
}
