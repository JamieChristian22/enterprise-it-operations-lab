[CmdletBinding()] param([string]$Path="$PSScriptRoot\..\Reports\bitlocker-status.csv")
Get-BitLockerVolume|Select MountPoint,VolumeStatus,ProtectionStatus,EncryptionPercentage,EncryptionMethod|Export-Csv $Path -NoTypeInformation; Get-BitLockerVolume|Format-Table -Auto
