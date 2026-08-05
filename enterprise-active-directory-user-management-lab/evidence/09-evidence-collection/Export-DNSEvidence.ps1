[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$OutputPath,
    [string]$DomainController = "DC01",
    [string]$FileServer = "FS01",
    [string]$ClientComputer = "CL01"
)

$domain = (Get-ADDomain).DNSRoot
$results = @()

foreach ($query in @(
    $domain,
    "$DomainController.$domain",
    "_ldap._tcp.dc._msdcs.$domain"
)) {
    try {
        $answer = Resolve-DnsName $query -ErrorAction Stop
        $results += [pscustomobject]@{
            Query = $query
            Status = "PASS"
            Result = ($answer | Out-String).Trim()
        }
    }
    catch {
        $results += [pscustomobject]@{
            Query = $query
            Status = "FAIL"
            Result = $_.Exception.Message
        }
    }
}

$results | Export-Csv (Join-Path $OutputPath "dns-validation-live.csv") -NoTypeInformation
