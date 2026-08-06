[CmdletBinding()]param([string]$OutputPath=".\hyperv-health-report.csv")
$ErrorActionPreference="Stop"
try{Import-Module FailoverClusters;Import-Module Hyper-V
$r=@();Get-ClusterNode|%{$r+=[pscustomobject]@{Check="Node";Target=$_.Name;Status=$_.State;Details="Cluster node"}}
Get-ClusterGroup|%{$r+=[pscustomobject]@{Check="Role";Target=$_.Name;Status=$_.State;Details="Owner=$($_.OwnerNode)"}}
Get-ClusterSharedVolume|%{$i=$_.SharedVolumeInfo;$f=[math]::Round(($i.Partition.FreeSpace/$i.Partition.Size)*100,2);$s=if($f-lt15){"Critical"}elseif($f-lt25){"Warning"}else{"Healthy"};$r+=[pscustomobject]@{Check="CSV";Target=$_.Name;Status=$s;Details="FreePercent=$f"}}
$r|Export-Csv $OutputPath -NoTypeInformation;$r}catch{Write-Error $_;exit 1}
