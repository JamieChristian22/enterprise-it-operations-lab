[CmdletBinding()]
param([string[]]$ComputerName,[int]$MaximumAgeDays=45,[string]$Path="$PSScriptRoot\..\Reports\patch-compliance.csv")
if(-not $ComputerName){$ComputerName=(Get-ADComputer -Filter {Enabled-eq $true}).DNSHostName}
$cutoff=(Get-Date).AddDays(-$MaximumAgeDays)
$result=foreach($computer in $ComputerName){try{$hotfix=Get-HotFix -ComputerName $computer|Sort-Object InstalledOn -Descending|Select-Object -First 1;[pscustomobject]@{Computer=$computer;LatestHotfix=$hotfix.HotFixID;InstalledOn=$hotfix.InstalledOn;Compliant=($hotfix.InstalledOn-ge $cutoff);Checked=(Get-Date)}}catch{[pscustomobject]@{Computer=$computer;LatestHotfix='Unavailable';InstalledOn=$null;Compliant=$false;Checked=(Get-Date)}}}
New-Item (Split-Path $Path) -ItemType Directory -Force|Out-Null;$result|Export-Csv $Path -NoTypeInformation;$result
