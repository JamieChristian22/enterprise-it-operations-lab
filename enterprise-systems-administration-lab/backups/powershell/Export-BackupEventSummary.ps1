[CmdletBinding()]
param(
    [int]$Hours = 24,
    [string]$OutputCsv = ".\backup-events.csv"
)
$start = (Get-Date).AddHours(-$Hours)
$logs = @('Microsoft-Windows-Backup','System','Application')
$events = foreach ($log in $logs) {
    try {
        Get-WinEvent -FilterHashtable @{LogName=$log; StartTime=$start} -ErrorAction Stop |
            Where-Object { $_.LevelDisplayName -in @('Error','Warning') -or $_.ProviderName -match 'Backup|VSS' }
    } catch { }
}
$events | Select-Object TimeCreated, LogName, ProviderName, Id, LevelDisplayName, Message |
    Export-Csv $OutputCsv -NoTypeInformation
Write-Output $OutputCsv
