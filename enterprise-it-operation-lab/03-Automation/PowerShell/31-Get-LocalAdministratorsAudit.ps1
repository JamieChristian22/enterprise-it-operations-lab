[CmdletBinding()]
param([string[]]$ComputerName,[string]$Path="$PSScriptRoot\..\Reports\local-admins.csv")
if(-not $ComputerName){$ComputerName=(Get-ADComputer -Filter {Enabled-eq $true}).DNSHostName}
$result=foreach($computer in $ComputerName){try{Invoke-Command -ComputerName $computer -ScriptBlock{Get-LocalGroupMember Administrators|Select-Object @{n='Computer';e={$env:COMPUTERNAME}},Name,ObjectClass,PrincipalSource}}catch{[pscustomobject]@{Computer=$computer;Name='Collection failed';ObjectClass='Error';PrincipalSource=$_.Exception.Message}}}
New-Item (Split-Path $Path) -ItemType Directory -Force|Out-Null;$result|Export-Csv $Path -NoTypeInformation;$result
