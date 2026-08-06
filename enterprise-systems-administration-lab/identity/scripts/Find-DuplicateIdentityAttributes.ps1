[CmdletBinding()]
param(
    [string]$SearchBase,
    [string]$OutputPath = '.\duplicate-identity-attributes.csv'
)

Import-Module ActiveDirectory -ErrorAction Stop
$params = @{Filter='*'; Properties=@('UserPrincipalName','mail','proxyAddresses','Enabled','DistinguishedName')}
if($SearchBase){$params.SearchBase=$SearchBase}
$users = Get-ADUser @params
$records = foreach($user in $users){
    if($user.UserPrincipalName){[pscustomobject]@{Attribute='UserPrincipalName';Value=$user.UserPrincipalName.ToLower();SamAccountName=$user.SamAccountName;DN=$user.DistinguishedName}}
    if($user.mail){[pscustomobject]@{Attribute='mail';Value=$user.mail.ToLower();SamAccountName=$user.SamAccountName;DN=$user.DistinguishedName}}
    foreach($address in $user.proxyAddresses){
        [pscustomobject]@{Attribute='proxyAddresses';Value=$address.ToLower();SamAccountName=$user.SamAccountName;DN=$user.DistinguishedName}
    }
}
$duplicates = $records | Group-Object Attribute,Value | Where-Object Count -gt 1 | ForEach-Object {$_.Group}
$duplicates | Sort-Object Attribute,Value,SamAccountName | Export-Csv $OutputPath -NoTypeInformation
$duplicates
