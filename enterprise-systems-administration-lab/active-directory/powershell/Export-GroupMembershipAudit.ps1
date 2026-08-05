#requires -Modules ActiveDirectory
[CmdletBinding()] param([string]$OutputPath='.\group-membership-audit.csv')
Get-ADGroup -Filter * -Properties GroupCategory | ForEach-Object {
 $g=$_; $members=@(Get-ADGroupMember $g -ErrorAction SilentlyContinue)
 [pscustomobject]@{Group=$g.Name;Category=$g.GroupCategory;MemberCount=$members.Count;Users=($members|Where objectClass -eq user|Select -Expand Name)-join ';';Groups=($members|Where objectClass -eq group|Select -Expand Name)-join ';'}
}|Export-Csv $OutputPath -NoTypeInformation
