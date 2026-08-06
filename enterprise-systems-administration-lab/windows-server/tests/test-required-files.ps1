$required=@('README.md','documentation/server-build-guide.md','documentation/file-services.md','powershell/Get-ServerHealth.ps1','powershell/New-DepartmentShare.ps1','runbooks/service-failure.md');$failed=$false
foreach($item in $required){if(Test-Path $item){Write-Host "PASS $item"}else{Write-Error "Missing $item";$failed=$true}}
if($failed){exit 1}
