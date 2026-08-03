[CmdletBinding()]
param([string[]]$ComputerName='CTS-DC01','CTS-DC02','CTS-FS01','CTS-MGMT01',[string]$Path="$PSScriptRoot\..\Reports\critical-services.csv")
$map=@{'CTS-DC01'='NTDS','DNS','Netlogon','KDC';'CTS-DC02'='NTDS','DNS','Netlogon','KDC';'CTS-FS01'='LanmanServer','DFSR';'CTS-MGMT01'='WsusService','W3SVC'}
$result=foreach($computer in $ComputerName){foreach($name in $map[$computer]){try{$s=Get-Service -ComputerName $computer -Name $name -ErrorAction Stop;[pscustomobject]@{Computer=$computer;Service=$name;Status=$s.Status;Healthy=($s.Status-eq 'Running');Checked=(Get-Date)}}catch{[pscustomobject]@{Computer=$computer;Service=$name;Status='NotFound';Healthy=$false;Checked=(Get-Date)}}}}
New-Item (Split-Path $Path) -ItemType Directory -Force|Out-Null;$result|Export-Csv $Path -NoTypeInformation;$result
