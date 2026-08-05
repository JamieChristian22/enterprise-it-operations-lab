[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$OutputPath,
    [string]$DomainController = "DC01",
    [string]$FileServer = "FS01",
    [string]$ClientComputer = "CL01"
)

$shares = Invoke-Command -ComputerName $FileServer -ScriptBlock {
    Get-SmbShare | Where-Object {
        $_.Name -notin @("ADMIN$","C$","IPC$")
    } | Select-Object Name,Path,Description
}

$shares | Export-Csv (Join-Path $OutputPath "smb-shares-live.csv") -NoTypeInformation

$aclRows = foreach ($share in $shares) {
    $unc = "\\$FileServer\$($share.Name)"
    try {
        $acl = Get-Acl $unc
        foreach ($entry in $acl.Access) {
            [pscustomobject]@{
                Share = $share.Name
                Path = $unc
                Identity = $entry.IdentityReference
                Rights = $entry.FileSystemRights
                AccessType = $entry.AccessControlType
                Inherited = $entry.IsInherited
                InheritanceFlags = $entry.InheritanceFlags
                PropagationFlags = $entry.PropagationFlags
            }
        }
    }
    catch {
        [pscustomobject]@{
            Share = $share.Name
            Path = $unc
            Identity = "ERROR"
            Rights = $_.Exception.Message
            AccessType = ""
            Inherited = ""
            InheritanceFlags = ""
            PropagationFlags = ""
        }
    }
}

$aclRows | Export-Csv (Join-Path $OutputPath "ntfs-permissions-live.csv") -NoTypeInformation
