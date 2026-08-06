[CmdletBinding()]
param([string]$ComputerName=$env:COMPUTERNAME,[string[]]$ServiceName=@('Dnscache','LanmanServer','EventLog'))
foreach($name in $ServiceName){
 try { Get-Service -ComputerName $ComputerName -Name $name -ErrorAction Stop | Select-Object MachineName,Name,Status,StartType }
 catch { [pscustomobject]@{MachineName=$ComputerName;Name=$name;Status='NotFound';StartType='Unknown'} }
}
