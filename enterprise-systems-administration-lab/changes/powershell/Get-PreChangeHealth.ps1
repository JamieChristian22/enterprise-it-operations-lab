[CmdletBinding()]
param([string[]]$ComputerName = @($env:COMPUTERNAME))
$results = foreach ($computer in $ComputerName) {
    try {
        $os = Get-CimInstance Win32_OperatingSystem -ComputerName $computer -ErrorAction Stop
        $disk = Get-CimInstance Win32_LogicalDisk -ComputerName $computer -Filter "DriveType=3"
        [pscustomobject]@{
            Computer = $computer
            Status = 'Reachable'
            LastBoot = $os.LastBootUpTime
            FreeDiskGB = [math]::Round((($disk | Measure-Object FreeSpace -Sum).Sum / 1GB),2)
        }
    } catch {
        [pscustomobject]@{Computer=$computer;Status='Failed';LastBoot=$null;FreeDiskGB=$null}
    }
}
$results
