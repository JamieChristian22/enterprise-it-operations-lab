[CmdletBinding()]
param([string[]]$ComputerName,[string]$Path="$PSScriptRoot\..\Reports\bitlocker-compliance.csv")
if(-not $ComputerName){$ComputerName=(Get-ADComputer -Filter {OperatingSystem-like 'Windows 1*' -and Enabled-eq $true}).DNSHostName}
$result=foreach($computer in $ComputerName){try{Invoke-Command -ComputerName $computer -ScriptBlock{Get-BitLockerVolume -MountPoint 'C:'|Select-Object @{n='Computer';e={$env:COMPUTERNAME}},MountPoint,VolumeStatus,ProtectionStatus,EncryptionMethod,EncryptionPercentage}}catch{[pscustomobject]@{Computer=$computer;MountPoint='C:';VolumeStatus='Unknown';ProtectionStatus='Unknown';EncryptionMethod='Unknown';EncryptionPercentage=0}}}
New-Item (Split-Path $Path) -ItemType Directory -Force|Out-Null;$result|Export-Csv $Path -NoTypeInformation;$result
