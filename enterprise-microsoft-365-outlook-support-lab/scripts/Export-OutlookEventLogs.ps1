[CmdletBinding()]
param(
    [int]$HoursBack = 24,
    [string]$OutputDirectory = "$env:USERPROFILE\Desktop"
)

$ErrorActionPreference = "Stop"
Import-Module (Join-Path $PSScriptRoot "modules\Support.Common.psm1") -Force

$outDir = New-SupportOutputDirectory -BasePath $OutputDirectory -Prefix "OutlookEvents"
$log = Join-Path $outDir "run.log"
$csv = Join-Path $outDir "outlook-application-events.csv"
$start = (Get-Date).AddHours(-1 * [math]::Abs($HoursBack))

try {
    Write-SupportLog -Message "Reading Application events since $start." -LogPath $log

    $events = Get-WinEvent -FilterHashtable @{
        LogName   = "Application"
        StartTime = $start
        Level     = 1, 2, 3
    } -ErrorAction Stop |
    Where-Object {
        $_.ProviderName -match "Outlook|Application Error|Office|Windows Error Reporting" -or
        $_.Message -match "OUTLOOK\.EXE|Microsoft Outlook"
    } |
    Select-Object @{
        Name = "CollectedAt"; Expression = { Get-Date -Format "yyyy-MM-dd HH:mm:ss" }
    }, TimeCreated, Id, LevelDisplayName, ProviderName, MachineName, Message

    if ($events) {
        $events | Export-Csv -Path $csv -NoTypeInformation -Encoding utf8
        Write-SupportLog -Message "Exported $($events.Count) relevant events to $csv" -Level SUCCESS -LogPath $log
    } else {
        "No matching Outlook events were found." | Out-File $csv -Encoding utf8
        Write-SupportLog -Message "No matching Outlook events found." -Level WARN -LogPath $log
    }
}
catch {
    Write-SupportLog -Message $_.Exception.Message -Level ERROR -LogPath $log
    exit 1
}
