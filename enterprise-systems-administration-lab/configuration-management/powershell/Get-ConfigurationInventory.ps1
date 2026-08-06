[CmdletBinding()] param([string[]]$ComputerName)
foreach($c in $ComputerName){ Invoke-Command -ComputerName $c -ScriptBlock { [pscustomobject]@{Computer=$env:COMPUTERNAME;OS=(Get-CimInstance Win32_OperatingSystem).Caption;LastBoot=(Get-CimInstance Win32_OperatingSystem).LastBootUpTime;Features=(Get-WindowsFeature | Where-Object InstallState -eq Installed).Name -join ';'} } }
