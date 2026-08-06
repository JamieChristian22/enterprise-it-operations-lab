#Requires -Version 5.1
[CmdletBinding()]
param(
    [string[]]$ComputerName = @($env:COMPUTERNAME),
    [string]$OutputPath = ".\output\server-health.csv"
)

$rows = foreach ($computer in $ComputerName) {
    Invoke-Command -ComputerName $computer -ScriptBlock {
        $os = Get-CimInstance Win32_OperatingSystem
        $disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
        [pscustomobject]@{
            Server = $env:COMPUTERNAME
            Platform = $os.Caption
            MemoryAvailablePercent = [math]::Round(($os.FreePhysicalMemory / $os.TotalVisibleMemorySize) * 100, 2)
            DiskFreePercent = [math]::Round(($disk.FreeSpace / $disk.Size) * 100, 2)
            LastBoot = $os.LastBootUpTime
            Status = "Collected"
        }
    }
}

New-Item (Split-Path $OutputPath) -ItemType Directory -Force | Out-Null
$rows | Export-Csv $OutputPath -NoTypeInformation
$rows
