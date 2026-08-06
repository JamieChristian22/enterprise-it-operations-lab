[CmdletBinding()]
param([string[]]$ComputerName = $env:COMPUTERNAME)
$results = foreach ($computer in $ComputerName) {
  try {
    $os = Get-CimInstance Win32_OperatingSystem -ComputerName $computer -ErrorAction Stop
    $cpu = Get-CimInstance Win32_Processor -ComputerName $computer -ErrorAction Stop
    [pscustomobject]@{
      ComputerName = $computer
      CpuCores = ($cpu.NumberOfLogicalProcessors | Measure-Object -Sum).Sum
      MemoryTotalGB = [math]::Round($os.TotalVisibleMemorySize / 1MB,2)
      MemoryUsedPct = [math]::Round((1-($os.FreePhysicalMemory/$os.TotalVisibleMemorySize))*100,2)
      LastBoot = $os.LastBootUpTime
    }
  } catch {
    [pscustomobject]@{ComputerName=$computer;CpuCores=$null;MemoryTotalGB=$null;MemoryUsedPct=$null;LastBoot=$null;Error=$_.Exception.Message}
  }
}
$results
