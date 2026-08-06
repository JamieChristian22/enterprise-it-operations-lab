[CmdletBinding()] param([string]$Inventory='.\inventory.csv',[string]$Compliance='.\dsc-compliance.csv',[string]$Output='.\configuration-health.html')
$i=Import-Csv $Inventory;$c=Import-Csv $Compliance;$body="<h1>Configuration Health</h1><p>Managed nodes: $($i.Count)</p><p>Compliant nodes: $(@($c|? InDesiredState -eq 'True').Count)</p>";$body|Out-File $Output -Encoding utf8
