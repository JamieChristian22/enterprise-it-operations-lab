Configuration EnterpriseBaseline {
 param([string[]]$NodeName='localhost')
 Import-DscResource -ModuleName PSDesiredStateConfiguration
 Node $NodeName {
  WindowsFeature TelnetClient { Name='Telnet-Client'; Ensure='Absent' }
  Service WindowsTime { Name='W32Time'; StartupType='Automatic'; State='Running' }
  Registry ScriptBlockLogging { Key='HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging'; ValueName='EnableScriptBlockLogging'; ValueData=1; ValueType='Dword'; Ensure='Present' }
  File OperationsDirectory { DestinationPath='C:\ProgramData\Northstar\Operations'; Type='Directory'; Ensure='Present' }
 }
}
EnterpriseBaseline -OutputPath .\output
