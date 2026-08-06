Configuration WebServer {
 param([string[]]$NodeName='localhost')
 Import-DscResource -ModuleName PSDesiredStateConfiguration
 Node $NodeName {
  WindowsFeature IIS { Name='Web-Server'; Ensure='Present' }
  WindowsFeature IISLogging { Name='Web-Http-Logging'; Ensure='Present'; DependsOn='[WindowsFeature]IIS' }
  File WebRoot { DestinationPath='C:\inetpub\northstar'; Type='Directory'; Ensure='Present'; DependsOn='[WindowsFeature]IIS' }
  File HealthPage { DestinationPath='C:\inetpub\northstar\health.html'; Contents='<h1>Northstar Portal Healthy</h1>'; Ensure='Present'; DependsOn='[File]WebRoot' }
 }
}
WebServer -OutputPath .\output
