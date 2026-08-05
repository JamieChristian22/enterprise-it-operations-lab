[CmdletBinding()]
param(
    [Parameter(Mandatory)] [string]$Path,
    [string]$OutputCsv = ".\backup-manifest.csv"
)
$root = (Resolve-Path $Path).Path
Get-ChildItem $root -File -Recurse | ForEach-Object {
    [pscustomobject]@{
        RelativePath = $_.FullName.Substring($root.Length).TrimStart('\')
        Length = $_.Length
        LastWriteTime = $_.LastWriteTimeUtc
        SHA256 = (Get-FileHash $_.FullName -Algorithm SHA256).Hash
    }
} | Export-Csv $OutputCsv -NoTypeInformation
Write-Output $OutputCsv
