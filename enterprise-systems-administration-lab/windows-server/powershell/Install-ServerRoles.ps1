[CmdletBinding(SupportsShouldProcess)]param([string[]]$FeatureName=@('FS-FileServer','FS-Resource-Manager','Windows-Server-Backup'))
foreach($feature in $FeatureName){if($PSCmdlet.ShouldProcess($feature,'Install Windows feature')){Install-WindowsFeature $feature -IncludeManagementTools -ErrorAction Stop}}
Get-WindowsFeature $FeatureName
