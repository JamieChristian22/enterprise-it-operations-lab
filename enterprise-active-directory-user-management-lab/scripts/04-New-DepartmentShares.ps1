Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
function Write-LabLog {
    param([string]$Message,[ValidateSet('INFO','WARN','ERROR','SUCCESS')][string]$Level='INFO',[string]$LogPath)
    $line = "{0:u} [{1}] {2}" -f (Get-Date),$Level,$Message
    $line | Tee-Object -FilePath $LogPath -Append
}

[CmdletBinding(SupportsShouldProcess)] param()
$Root=Split-Path -Parent $PSScriptRoot
$LogDir=Join-Path $Root 'evidence\logs';New-Item -ItemType Directory $LogDir -Force|Out-Null
$LogPath=Join-Path $LogDir ("shares-{0}.log" -f (Get-Date -Format 'yyyyMMdd-HHmmss'))
foreach($s in Import-Csv (Join-Path $Root 'config\shares.csv')){
 if(-not(Test-Path $s.Path)){if($PSCmdlet.ShouldProcess($s.Path,'Create folder')){New-Item -ItemType Directory -Path $s.Path -Force|Out-Null}}
 $acl=Get-Acl $s.Path;$acl.SetAccessRuleProtection($true,$false)
 $rules=@(
  New-Object System.Security.AccessControl.FileSystemAccessRule($s.FullAccessGroup,'FullControl','ContainerInherit,ObjectInherit','None','Allow'),
  New-Object System.Security.AccessControl.FileSystemAccessRule('NT AUTHORITY\SYSTEM','FullControl','ContainerInherit,ObjectInherit','None','Allow'),
  New-Object System.Security.AccessControl.FileSystemAccessRule($s.ChangeAccessGroup,'Modify','ContainerInherit,ObjectInherit','None','Allow')
 )
 if($s.ReadAccessGroup){$rules+=New-Object System.Security.AccessControl.FileSystemAccessRule($s.ReadAccessGroup,'ReadAndExecute','ContainerInherit,ObjectInherit','None','Allow')}
 foreach($r in $rules){$acl.AddAccessRule($r)|Out-Null}
 if($PSCmdlet.ShouldProcess($s.Path,'Apply NTFS permissions')){Set-Acl -Path $s.Path -AclObject $acl}
 if(-not(Get-SmbShare -Name $s.Name -ErrorAction SilentlyContinue)){if($PSCmdlet.ShouldProcess($s.Name,'Create SMB share')){New-SmbShare -Name $s.Name -Path $s.Path -FullAccess $s.FullAccessGroup -ChangeAccess $s.ChangeAccessGroup -ReadAccess $s.ReadAccessGroup -FolderEnumerationMode AccessBased|Out-Null}}
 Write-LabLog "Configured $($s.Name) at $($s.Path)." SUCCESS $LogPath
}
