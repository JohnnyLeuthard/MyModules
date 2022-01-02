# Implement your module commands in this script.

$global:FolderPath = $PSScriptRoot
$module = Get-Module -ListAvailable -Name MyModules  ##??
$modulePath = $module.ModuleBase
$global:Temp = $module
$global:temp2 = $PSScriptRoot

# Export only the functions using PowerShell standard verb-noun naming.
# Be sure to list each exported functions in the FunctionsToExport field of the module manifest file.
# This improves performance of command discovery in PowerShell.
##Export-ModuleMember -Function *-*

#Get-Childitem $PSScriptRoot\Functions -Recurse -Filter "*.ps1" -Exclude "_*.ps1xml", "*.old", "__*.ps1" |
Get-Childitem $PSScriptRoot\Functions -Recurse -Filter "*.ps1" -Exclude "_*.ps1xml", "*.old", "__*.ps1" |
  ForEach-Object {
      Try{
        . $_.FullName
      } Catch {
        Write-Error "Failed to import fucntion $($_.FullName)"
      }
  }


Export-ModuleMember -Function 'Get-*', 'New-*'

