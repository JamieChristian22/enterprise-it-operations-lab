Configuration MonitoringNode {
 param([string[]]$NodeName='localhost')
 Import-DscResource -ModuleName PSDesiredStateConfiguration
 Node $NodeName {
  File MonitorConfig { DestinationPath='C:\ProgramData\Northstar\Monitoring\agent.json'; Contents='{ "interval_seconds": 60, "environment": "lab" }'; Ensure='Present'; Type='File' }
  Service EventLog { Name='EventLog'; StartupType='Automatic'; State='Running' }
 }
}
MonitoringNode -OutputPath .\output
