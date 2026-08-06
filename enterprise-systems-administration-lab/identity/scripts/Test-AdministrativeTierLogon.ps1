[CmdletBinding()]
param(
    [Parameter(Mandatory)][ValidateSet('Tier0','Tier1','Tier2')] [string]$AccountTier,
    [Parameter(Mandatory)][ValidateSet('Tier0','Tier1','Tier2','PAW')] [string]$TargetTier
)
$allowed = switch($AccountTier){
    'Tier0' { $TargetTier -in @('Tier0','PAW') }
    'Tier1' { $TargetTier -eq 'Tier1' }
    'Tier2' { $TargetTier -eq 'Tier2' }
}
[pscustomobject]@{
    AccountTier=$AccountTier
    TargetTier=$TargetTier
    ExpectedResult=$(if($allowed){'ALLOW'}else{'DENY'})
    Control='Administrative tier logon restriction'
}
