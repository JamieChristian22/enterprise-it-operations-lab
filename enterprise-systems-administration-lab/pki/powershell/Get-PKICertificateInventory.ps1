#Requires -Version 5.1
[CmdletBinding()]
param(
    [string]$CAConfig,
    [string]$OutputPath = ".\reports\certificate-inventory.csv"
)

$ErrorActionPreference = "Stop"

if (-not $CAConfig) {
    $CAConfig = (certutil -config - -ping 2>$null |
        Select-String 'Config:').ToString().Split('"')[1]
}

$view = New-Object -ComObject CertificateAuthority.View
$view.OpenConnection($CAConfig)
$view.SetResultColumnCount(6)

@(
    "RequestID",
    "CommonName",
    "CertificateTemplate",
    "NotBefore",
    "NotAfter",
    "SerialNumber"
) | ForEach-Object { $view.SetResultColumn($_) }

$rows = @()
$row = $view.OpenView()
while ($row.Next() -ne -1) {
    $item = [ordered]@{}
    $column = $row.EnumCertViewColumn()
    while ($column.Next() -ne -1) {
        $item[$column.GetName()] = $column.GetValue(1)
    }
    $rows += [pscustomobject]$item
}

$rows | Export-Csv -Path $OutputPath -NoTypeInformation
$rows
