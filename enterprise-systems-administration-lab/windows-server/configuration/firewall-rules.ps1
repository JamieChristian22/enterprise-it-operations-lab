[CmdletBinding(SupportsShouldProcess)]param([string]$ManagementSubnet='10.20.30.0/24')
if($PSCmdlet.ShouldProcess('Windows Firewall','Apply baseline')){
 Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled True -DefaultInboundAction Block
 Enable-NetFirewallRule -DisplayGroup 'Windows Remote Management'
 New-NetFirewallRule -DisplayName 'Northstar RDP Management' -Direction Inbound -Protocol TCP -LocalPort 3389 -RemoteAddress $ManagementSubnet -Action Allow -Profile Domain
}
