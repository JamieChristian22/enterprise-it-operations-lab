Configuration FileServer {
 param([string[]]$NodeName='localhost')
 Import-DscResource -ModuleName PSDesiredStateConfiguration
 Node $NodeName {
  WindowsFeature FileServices { Name='FS-FileServer'; Ensure='Present' }
  File ShareRoot { DestinationPath='D:\Shares\Operations'; Type='Directory'; Ensure='Present'; DependsOn='[WindowsFeature]FileServices' }
 }
}
FileServer -OutputPath .\output
