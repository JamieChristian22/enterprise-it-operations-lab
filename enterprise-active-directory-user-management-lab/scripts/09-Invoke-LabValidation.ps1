Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
function Write-LabLog {
    param([string]$Message,[ValidateSet('INFO','WARN','ERROR','SUCCESS')][string]$Level='INFO',[string]$LogPath)
    $line = "{0:u} [{1}] {2}" -f (Get-Date),$Level,$Message
    $line | Tee-Object -FilePath $LogPath -Append
}

Import-Module ActiveDirectory
$Root=Split-Path -Parent $PSScriptRoot;$ReportDir=Join-Path $Root 'evidence\reports';New-Item -ItemType Directory $ReportDir -Force|Out-Null
$out=Join-Path $ReportDir 'lab-validation-results.csv';$dn=(Get-ADDomain).DistinguishedName;$results=@()
function Add-Test($id,$control,$passed,$details){$script:results += [pscustomobject]@{TestID=$id;Control=$control;Status=$(if($passed){'Pass'}else{'Fail'});Details=$details;CheckedAt=(Get-Date)}}
Add-Test 'VAL-01' 'Northstar root OU exists' ([bool](Get-ADOrganizationalUnit -Identity "OU=Northstar,$dn" -ErrorAction SilentlyContinue)) 'Root OU query'
foreach($g in (Import-Csv (Join-Path $Root 'config\groups.csv'))){Add-Test "GRP-$($g.Name)" "Group $($g.Name) exists" ([bool](Get-ADGroup $g.Name -ErrorAction SilentlyContinue)) 'AD group lookup'}
foreach($u in (Import-Csv (Join-Path $Root 'config\users.csv'))){$obj=Get-ADUser $u.SamAccountName -Properties Department -ErrorAction SilentlyContinue;Add-Test "USR-$($u.SamAccountName)" "User exists with correct department" ([bool]($obj -and $obj.Department -eq $u.Department)) "Expected $($u.Department)"}
foreach($n in (Import-Csv (Join-Path $Root 'config\group-nesting.csv'))){$members=(Get-ADGroupMember $n.ParentGroup -ErrorAction SilentlyContinue).SamAccountName;Add-Test "NEST-$($n.MemberGroup)" 'Required group nesting exists' ($members -contains $n.MemberGroup) "$($n.MemberGroup) -> $($n.ParentGroup)"}
$results|Export-Csv $out -NoTypeInformation
$results|Format-Table -AutoSize
if($results.Status -contains 'Fail'){exit 2}
