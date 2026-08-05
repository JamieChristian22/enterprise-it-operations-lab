[CmdletBinding()]
param(
    [Parameter(Mandatory)] [string]$ManifestCsv,
    [Parameter(Mandatory)] [string]$Repository,
    [string]$ResultsCsv = ".\integrity-results.csv"
)
$ErrorActionPreference = 'Stop'
$manifest = Import-Csv $ManifestCsv
$results = foreach ($item in $manifest) {
    $path = Join-Path $Repository $item.RelativePath
    if (-not (Test-Path $path)) {
        [pscustomobject]@{RelativePath=$item.RelativePath;Expected=$item.SHA256;Actual='MISSING';Status='FAIL'}
        continue
    }
    $actual = (Get-FileHash $path -Algorithm SHA256).Hash
    [pscustomobject]@{RelativePath=$item.RelativePath;Expected=$item.SHA256;Actual=$actual;Status=if($actual -eq $item.SHA256){'PASS'}else{'FAIL'}}
}
$results | Export-Csv $ResultsCsv -NoTypeInformation
if ($results.Status -contains 'FAIL') { throw "Integrity validation failed. Review $ResultsCsv" }
$results
