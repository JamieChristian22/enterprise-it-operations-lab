[CmdletBinding()]
param([string[]]$ComputerName=$env:COMPUTERNAME)
Set-StrictMode -Version Latest
$ErrorActionPreference='Stop'
foreach($computer in $ComputerName){
    Invoke-Command -ComputerName $computer -ScriptBlock {
        Get-CimInstance Win32_Service | Where-Object { $_.StartMode -eq 'Auto' -and $_.State -ne 'Running' } |
        Select-Object @{n='ComputerName';e={$env:COMPUTERNAME}},Name,DisplayName,State,StartMode,ExitCode
    }
}
