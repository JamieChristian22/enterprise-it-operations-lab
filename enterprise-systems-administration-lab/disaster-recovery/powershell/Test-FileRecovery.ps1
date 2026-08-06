[CmdletBinding()]
param([Parameter(Mandatory)][string]$Path,[Parameter(Mandatory)][string]$ManifestCsv)
$manifest = Import-Csv $ManifestCsv
$results = foreach ($item in $manifest) {
  $full = Join-Path $Path $item.RelativePath
  if (Test-Path $full) {
    $hash=(Get-FileHash $full -Algorithm SHA256).Hash
    [pscustomobject]@{File=$item.RelativePath;Expected=$item.SHA256;Actual=$hash;Match=($hash -eq $item.SHA256)}
  } else {
    [pscustomobject]@{File=$item.RelativePath;Expected=$item.SHA256;Actual='MISSING';Match=$false}
  }
}
$results | Format-Table -AutoSize
if ($results.Match -contains $false) { exit 2 }
