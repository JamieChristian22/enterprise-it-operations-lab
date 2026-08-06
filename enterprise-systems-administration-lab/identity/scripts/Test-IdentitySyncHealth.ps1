[CmdletBinding()]
param(
    [string]$OutputPath = ".\identity-sync-health-$((Get-Date).ToString('yyyyMMdd-HHmmss')).txt",
    [int]$MaximumCycleAgeMinutes = 30
)

$ErrorActionPreference = 'Stop'
$lines = [System.Collections.Generic.List[string]]::new()
function Add-Result { param([string]$Name,[string]$Status,[string]$Detail)
    $lines.Add(("{0,-32} {1,-10} {2}" -f $Name,$Status,$Detail))
}

try {
    Import-Module ADSync -ErrorAction Stop
    $scheduler = Get-ADSyncScheduler
    Add-Result 'Scheduler enabled' ($(if($scheduler.SyncCycleEnabled){'PASS'}else{'FAIL'})) $scheduler.SyncCycleEnabled
    Add-Result 'Staging mode' ($(if($scheduler.StagingModeEnabled){'INFO'}else{'PASS'})) $scheduler.StagingModeEnabled
    Add-Result 'Next cycle policy' 'INFO' $scheduler.NextSyncCyclePolicyType
    Add-Result 'Next cycle start' 'INFO' $scheduler.NextSyncCycleStartTimeInUTC

    $events = Get-WinEvent -FilterHashtable @{LogName='Application'; ProviderName='Directory Synchronization'; StartTime=(Get-Date).AddHours(-4)} -ErrorAction SilentlyContinue
    $success = $events | Where-Object { $_.Id -in 650,651,656 } | Sort-Object TimeCreated -Descending | Select-Object -First 1
    if($success){
        $age = ((Get-Date) - $success.TimeCreated).TotalMinutes
        Add-Result 'Recent sync event' ($(if($age -le $MaximumCycleAgeMinutes){'PASS'}else{'WARN'})) ("{0:N1} minutes old" -f $age)
    } else { Add-Result 'Recent sync event' 'WARN' 'No success event found in four-hour window' }

    $services = 'ADSync'
    foreach($serviceName in $services){
        $svc = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
        if($svc){ Add-Result "Service $serviceName" ($(if($svc.Status -eq 'Running'){'PASS'}else{'FAIL'})) $svc.Status }
        else { Add-Result "Service $serviceName" 'FAIL' 'Service not found' }
    }
} catch {
    Add-Result 'Health check execution' 'FAIL' $_.Exception.Message
}

$header = @(
    'Northstar Lab - Identity Synchronization Health',
    "Generated: $(Get-Date -Format o)",
    "Computer: $env:COMPUTERNAME",
    ('-'*90)
)
($header + $lines) | Set-Content -Path $OutputPath -Encoding UTF8
Get-Content $OutputPath
