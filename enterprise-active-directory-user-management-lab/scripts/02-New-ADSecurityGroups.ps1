Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
function Write-LabLog {
    param([string]$Message,[ValidateSet('INFO','WARN','ERROR','SUCCESS')][string]$Level='INFO',[string]$LogPath)
    $line = "{0:u} [{1}] {2}" -f (Get-Date),$Level,$Message
    $line | Tee-Object -FilePath $LogPath -Append
}

[CmdletBinding(SupportsShouldProcess)] param()
Import-Module ActiveDirectory
$Root=Split-Path -Parent $PSScriptRoot;$dn=(Get-ADDomain).DistinguishedName
$LogDir=Join-Path $Root 'evidence\logs';New-Item -ItemType Directory $LogDir -Force|Out-Null
$LogPath=Join-Path $LogDir ("groups-{0}.log" -f (Get-Date -Format 'yyyyMMdd-HHmmss'))
foreach($g in Import-Csv (Join-Path $Root 'config\groups.csv')){
 $path="OU=$($g.OU),OU=Groups,OU=Northstar,$dn"
 if(Get-ADGroup -Filter "SamAccountName -eq '$($g.Name)'" -ErrorAction SilentlyContinue){Write-LabLog "Group exists: $($g.Name)" INFO $LogPath;continue}
 if($PSCmdlet.ShouldProcess($g.Name,'Create AD security group')){New-ADGroup -Name $g.Name -SamAccountName $g.Name -GroupScope $g.Scope -GroupCategory $g.Category -Path $path -Description $g.Description;Write-LabLog "Created group: $($g.Name)" SUCCESS $LogPath}
}
foreach($n in Import-Csv (Join-Path $Root 'config\group-nesting.csv')){
 $members=(Get-ADGroupMember $n.ParentGroup -ErrorAction SilentlyContinue).SamAccountName
 if($members -contains $n.MemberGroup){continue}
 if($PSCmdlet.ShouldProcess($n.ParentGroup,"Add nested group $($n.MemberGroup)")){Add-ADGroupMember -Identity $n.ParentGroup -Members $n.MemberGroup;Write-LabLog "Nested $($n.MemberGroup) into $($n.ParentGroup)" SUCCESS $LogPath}
}
