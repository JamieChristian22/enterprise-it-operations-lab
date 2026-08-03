[CmdletBinding()] param([string]$Path="$PSScriptRoot\..\Reports\installed-software.csv")
$keys='HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
Get-ItemProperty $keys -ErrorAction SilentlyContinue|Where DisplayName|Select DisplayName,DisplayVersion,Publisher,InstallDate|Sort DisplayName -Unique|Export-Csv $Path -NoTypeInformation; "Saved $Path"
