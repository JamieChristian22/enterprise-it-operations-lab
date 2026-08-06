[CmdletBinding()]
param([string]$OutputPath='.\privileged-access-review.csv')
Import-Module ActiveDirectory -ErrorAction Stop
$groups='Domain Admins','Enterprise Admins','Schema Admins','Tier0-Admins','Tier1-Admins','Tier2-Admins'
$report=foreach($group in $groups){
    $g=Get-ADGroup -Identity $group -ErrorAction SilentlyContinue
    if($g){
        Get-ADGroupMember $g -Recursive | ForEach-Object {
            $u=Get-ADObject $_.DistinguishedName -Properties whenChanged,description
            [pscustomobject]@{Group=$group;Name=$_.Name;SamAccountName=$_.SamAccountName;ObjectClass=$_.objectClass;LastChanged=$u.whenChanged;Description=$u.description}
        }
    }
}
$report | Sort-Object Group,Name | Export-Csv $OutputPath -NoTypeInformation
$report
