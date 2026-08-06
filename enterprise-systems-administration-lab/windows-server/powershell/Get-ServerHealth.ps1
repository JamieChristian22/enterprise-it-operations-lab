<#
.SYNOPSIS
Collects a standardized health snapshot from one or more Windows servers.
.DESCRIPTION
Returns operating system, uptime, CPU, memory, disk, required service, and critical event data. Results are exported as JSON and CSV for audit-friendly evidence.
.PARAMETER ComputerName
One or more target computers. Defaults to the local computer.
.PARAMETER Hours
Event-log lookback period. Default is 24 hours.
.PARAMETER OutputPath
Directory for timestamped report files.
.EXAMPLE
.\Get-ServerHealth.ps1 -ComputerName NSS-DC01,NSS-FILE01 -OutputPath .\reports\generated
#>
[CmdletBinding()]
param(
    [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
    [ValidateNotNullOrEmpty()]
    [string[]]$ComputerName = $env:COMPUTERNAME,

    [ValidateRange(1, 168)]
    [int]$Hours = 24,

    [ValidateNotNullOrEmpty()]
    [string]$OutputPath = (Join-Path $PSScriptRoot '..\reports\generated')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$requiredServices = @('EventLog', 'WinRM', 'W32Time')
$results = [System.Collections.Generic.List[object]]::new()

foreach ($computer in $ComputerName) {
    try {
        $result = Invoke-Command -ComputerName $computer -ErrorAction Stop -ScriptBlock {
            param($Hours, $RequiredServices)
            $os = Get-CimInstance Win32_OperatingSystem
            $cpu = Get-CimInstance Win32_Processor | Measure-Object LoadPercentage -Average
            $disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
                [pscustomobject]@{
                    Drive       = $_.DeviceID
                    SizeGB      = [math]::Round($_.Size / 1GB, 2)
                    FreeGB      = [math]::Round($_.FreeSpace / 1GB, 2)
                    FreePercent = if ($_.Size) { [math]::Round(($_.FreeSpace / $_.Size) * 100, 1) } else { 0 }
                    Status      = if ($_.Size -and (($_.FreeSpace / $_.Size) * 100) -ge 20) { 'Pass' } else { 'Fail' }
                }
            }
            $services = foreach ($name in $RequiredServices) {
                $service = Get-Service -Name $name -ErrorAction SilentlyContinue
                [pscustomobject]@{
                    Name   = $name
                    Status = if ($service) { [string]$service.Status } else { 'Missing' }
                }
            }
            $events = Get-WinEvent -FilterHashtable @{
                LogName   = @('System', 'Application')
                Level     = 1,2
                StartTime = (Get-Date).AddHours(-$Hours)
            } -ErrorAction SilentlyContinue

            [pscustomobject]@{
                ComputerName       = $env:COMPUTERNAME
                CollectedAt        = (Get-Date).ToString('o')
                OperatingSystem    = $os.Caption
                LastBootTime       = $os.LastBootUpTime
                UptimeHours        = [math]::Round(((Get-Date) - $os.LastBootUpTime).TotalHours, 1)
                CpuLoadPercent     = [math]::Round($cpu.Average, 1)
                MemoryTotalGB      = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
                MemoryFreeGB       = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
                MemoryFreePercent  = [math]::Round(($os.FreePhysicalMemory / $os.TotalVisibleMemorySize) * 100, 1)
                Disks              = $disks
                RequiredServices   = $services
                CriticalErrorCount = @($events).Count
                OverallStatus      = if (($disks.Status -contains 'Fail') -or ($services.Status -contains 'Stopped') -or ($services.Status -contains 'Missing')) { 'Fail' } else { 'Pass' }
            }
        } -ArgumentList $Hours, $requiredServices
        $results.Add($result)
    }
    catch {
        $results.Add([pscustomobject]@{
            ComputerName  = $computer
            CollectedAt   = (Get-Date).ToString('o')
            OverallStatus = 'Unreachable'
            Error         = $_.Exception.Message
        })
    }
}

New-Item -ItemType Directory -Path $OutputPath -Force | Out-Null
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$jsonPath = Join-Path $OutputPath "server-health-$stamp.json"
$csvPath  = Join-Path $OutputPath "server-health-$stamp.csv"
$results | ConvertTo-Json -Depth 6 | Set-Content -Path $jsonPath -Encoding UTF8
$results | Select-Object ComputerName, CollectedAt, OperatingSystem, UptimeHours, CpuLoadPercent, MemoryFreePercent, CriticalErrorCount, OverallStatus, Error |
    Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8

$results
