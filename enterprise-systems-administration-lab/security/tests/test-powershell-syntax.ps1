$failed=$false
Get-ChildItem powershell -Filter *.ps1|ForEach-Object{
 $tokens=$null;$errors=$null
 [System.Management.Automation.Language.Parser]::ParseFile($_.FullName,[ref]$tokens,[ref]$errors)|Out-Null
 if($errors.Count){$failed=$true;$errors|ForEach-Object{Write-Error $_}}else{Write-Host "PASS $($_.Name)"}
}
if($failed){exit 1}
