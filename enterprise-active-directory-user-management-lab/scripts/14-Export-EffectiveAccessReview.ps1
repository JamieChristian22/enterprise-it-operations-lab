[CmdletBinding()] param([string]$OutputPath="..\evidence\reports\effective-access-review.csv")
Set-StrictMode -Version Latest; $ErrorActionPreference='Stop'; Import-Module ActiveDirectory
$results=foreach($g in Get-ADGroup -Filter 'Name -like "DL_*"' -Properties Description){ foreach($m in Get-ADGroupMember $g -Recursive){ [pscustomobject]@{ResourceGroup=$g.Name;Member=$m.SamAccountName;ObjectClass=$m.objectClass;Purpose=$g.Description;Reviewed=(Get-Date).ToString('s')} } }; $results|Export-Csv $OutputPath -NoTypeInformation; $results
