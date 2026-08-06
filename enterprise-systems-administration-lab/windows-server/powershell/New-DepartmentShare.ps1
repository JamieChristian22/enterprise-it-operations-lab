[CmdletBinding(SupportsShouldProcess)]param([Parameter(Mandatory)][string]$Name,[Parameter(Mandatory)][string]$Path,[Parameter(Mandatory)][string]$ModifyGroup,[Parameter(Mandatory)][string]$ReadGroup)
if(Test-Path $Path){throw 'Path exists'}
if(Get-SmbShare -Name $Name -ErrorAction SilentlyContinue){throw 'Share exists'}
if($PSCmdlet.ShouldProcess($Path,'Create department share')){New-Item $Path -ItemType Directory -Force|Out-Null;New-SmbShare -Name $Name -Path $Path -ChangeAccess $ModifyGroup -ReadAccess $ReadGroup}
Get-SmbShare -Name $Name
