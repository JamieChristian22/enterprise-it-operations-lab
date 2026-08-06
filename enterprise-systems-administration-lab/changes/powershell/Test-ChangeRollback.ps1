[CmdletBinding()]
param([Parameter(Mandatory)][string]$ExpectedState,[Parameter(Mandatory)][string]$ActualState)
[pscustomobject]@{Expected=$ExpectedState;Actual=$ActualState;RollbackValidated=($ExpectedState -eq $ActualState)}
