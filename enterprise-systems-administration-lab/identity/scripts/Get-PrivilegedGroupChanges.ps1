[CmdletBinding()]
param(
    [int]$Hours = 24,
    [string]$OutputPath = '.\privileged-group-changes.csv'
)

$eventIds = 4728,4729,4732,4733,4756,4757
$events = Get-WinEvent -FilterHashtable @{LogName='Security';Id=$eventIds;StartTime=(Get-Date).AddHours(-$Hours)} -ErrorAction Stop
$results = foreach($event in $events){
    $xml=[xml]$event.ToXml(); $data=@{}
    foreach($item in $xml.Event.EventData.Data){$data[$item.Name]=$item.'#text'}
    [pscustomobject]@{
        TimeCreated=$event.TimeCreated
        EventId=$event.Id
        Actor="$($data.SubjectDomainName)\$($data.SubjectUserName)"
        Member=$data.MemberName
        Group=$data.TargetUserName
        Computer=$event.MachineName
        RecordId=$event.RecordId
    }
}
$results | Export-Csv $OutputPath -NoTypeInformation
$results
