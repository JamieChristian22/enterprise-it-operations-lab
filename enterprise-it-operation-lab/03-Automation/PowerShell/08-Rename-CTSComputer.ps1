[CmdletBinding(SupportsShouldProcess)] param([Parameter(Mandatory)][ValidatePattern('^[A-Z]{3}-[A-Z]{2,4}-\d{3}$')][string]$NewName)
if($PSCmdlet.ShouldProcess($env:COMPUTERNAME,"Rename to $NewName")){Rename-Computer -NewName $NewName -Force; "Restart required to complete rename"}
