[CmdletBinding()]
param(
    [string]$OutputDirectory = "$env:USERPROFILE\Desktop"
)

$ErrorActionPreference = "Stop"
Import-Module (Join-Path $PSScriptRoot "modules\Support.Common.psm1") -Force

$outDir = New-SupportOutputDirectory -BasePath $OutputDirectory -Prefix "OutlookProcess"
$log = Join-Path $outDir "run.log"
$csv = Join-Path $outDir "outlook-process-report.csv"

try {
    Write-SupportLog -Message "Collecting Outlook process information." -LogPath $log

    $processes = Get-CimInstance Win32_Process |
        Where-Object { $_.Name -match "^OUTLOOK\.EXE$" } |
        ForEach-Object {
            $owner = $null
            try {
                $ownerResult = Invoke-CimMethod -InputObject $_ -MethodName GetOwner
                if ($ownerResult.ReturnValue -eq 0) {
                    $owner = "$($ownerResult.Domain)\$($ownerResult.User)"
                }
            } catch {
                $owner = "Unavailable"
            }

            [pscustomobject]@{
                Timestamp       = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
                ProcessName     = $_.Name
                ProcessId       = $_.ProcessId
                ParentProcessId = $_.ParentProcessId
                ExecutablePath  = $_.ExecutablePath
                CommandLine     = $_.CommandLine
                Owner           = $owner
            }
        }

    if (-not $processes) {
        [pscustomobject]@{
            Timestamp       = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            ProcessName     = "OUTLOOK.EXE"
            ProcessId       = ""
            ParentProcessId = ""
            ExecutablePath  = ""
            CommandLine     = ""
            Owner           = ""
            Status          = "Not running"
        } | Export-Csv -Path $csv -NoTypeInformation -Encoding utf8

        Write-SupportLog -Message "Outlook is not currently running." -Level WARN -LogPath $log
    } else {
        $processes | Export-Csv -Path $csv -NoTypeInformation -Encoding utf8
        Write-SupportLog -Message "Outlook process report saved to $csv" -Level SUCCESS -LogPath $log
    }
}
catch {
    Write-SupportLog -Message $_.Exception.Message -Level ERROR -LogPath $log
    exit 1
}
