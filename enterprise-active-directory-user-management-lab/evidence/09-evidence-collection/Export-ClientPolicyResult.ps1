[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$OutputPath,
    [string]$DomainController = "DC01",
    [string]$FileServer = "FS01",
    [string]$ClientComputer = "CL01"
)

Invoke-Command -ComputerName $ClientComputer -ScriptBlock {
    param($Destination)
    gpresult /h "$env:TEMP\gpresult-live.html" /f
    gpresult /r | Out-File "$env:TEMP\gpresult-live.txt" -Encoding utf8
} -ArgumentList $OutputPath

Copy-Item "\\$ClientComputer\C$\Windows\Temp\gpresult-live.html" `
    (Join-Path $OutputPath "gpresult-live.html") -Force

Copy-Item "\\$ClientComputer\C$\Windows\Temp\gpresult-live.txt" `
    (Join-Path $OutputPath "gpresult-live.txt") -Force
