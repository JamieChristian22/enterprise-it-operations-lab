[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$OutputPath
)

$files = Get-ChildItem $OutputPath -File -Recurse |
    Where-Object { $_.Name -ne "SHA256SUMS-live.csv" }

$rows = foreach ($file in $files) {
    $hash = Get-FileHash $file.FullName -Algorithm SHA256
    [pscustomobject]@{
        File = $file.FullName.Substring($OutputPath.Length).TrimStart("\")
        SHA256 = $hash.Hash
        SizeBytes = $file.Length
        LastWriteTimeUtc = $file.LastWriteTimeUtc.ToString("o")
    }
}

$rows | Export-Csv (Join-Path $OutputPath "SHA256SUMS-live.csv") -NoTypeInformation
