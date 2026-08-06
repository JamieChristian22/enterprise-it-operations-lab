[DSCLocalConfigurationManager()]
configuration NorthstarLCM {
 Node localhost {
  Settings {
   RefreshMode='Push'
   ConfigurationMode='ApplyAndAutoCorrect'
   ConfigurationModeFrequencyMins=30
   RebootNodeIfNeeded=$true
   ActionAfterReboot='ContinueConfiguration'
   AllowModuleOverwrite=$false
  }
 }
}
NorthstarLCM -OutputPath .\lcm-output
Set-DscLocalConfigurationManager -Path .\lcm-output -Verbose
