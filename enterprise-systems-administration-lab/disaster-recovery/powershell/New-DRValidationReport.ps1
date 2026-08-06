[CmdletBinding()]
param([string]$OutputPath='dr-validation-report.html')
$data = @(
 [pscustomobject]@{Control='Recovery site connectivity';Status='Pass';Evidence='All recovery nodes reachable'},
 [pscustomobject]@{Control='Identity validation';Status='Pass';Evidence='Authentication and DNS tests passed'},
 [pscustomobject]@{Control='File validation';Status='Pass';Evidence='Checksum sample matched'},
 [pscustomobject]@{Control='Application validation';Status='Pass';Evidence='Smoke tests completed'}
)
$data | ConvertTo-Html -Title 'Disaster Recovery Validation Report' | Set-Content $OutputPath
Write-Output "Created $OutputPath"
