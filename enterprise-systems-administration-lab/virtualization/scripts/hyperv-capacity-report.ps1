[CmdletBinding()]param([string]$OutputPath=".\hyperv-capacity.csv")
Import-Module FailoverClusters
$r=Get-ClusterSharedVolume|%{$i=$_.SharedVolumeInfo;[pscustomobject]@{Name=$_.Name;Path=$i.FriendlyVolumeName;SizeGB=[math]::Round($i.Partition.Size/1GB,2);FreeGB=[math]::Round($i.Partition.FreeSpace/1GB,2);FreePercent=[math]::Round(($i.Partition.FreeSpace/$i.Partition.Size)*100,2)}}
$r|Export-Csv $OutputPath -NoTypeInformation;$r
