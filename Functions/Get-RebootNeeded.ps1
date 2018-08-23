
<#
   	.Synopsis
        Checks if a system is in need of a rebooot
	.Description


	.Example

		Description
		-------------------------



	.Link
        http://blogs.technet.com/b/heyscriptingguy/archive/2013/02/20/use-powershell-to-find-servers-that-need-a-reboot.aspx


	.Notes
    	Author: Johnny Leuthard
        Basic code obtined from the scripting guy's bloog
#>
Function Get-RebootNeeded
{

  [cmdletbinding()]
  Param
  (
    [Parameter(Mandatory = $true, HelpMessage = "The computer naame you want to run this against", Position = 0, ValuefromPipeline = $true)]
    $ComputerName
  )
  Begin
  {
    if (!($Creds)) {$Global:creds = Get-Credential}
  }
  Process
  {
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager'
    $Name = 'PendingFileRenameOperations'

    Invoke-Command -ComputerName $ComputerName -Credential $Creds -ScriptBlock {
      Get-ItemProperty -Path $using:path -Name $using:name
    } -ea 0 | Select-Object pscomputername, @{LABEL = 'RebootRequired'; EXPRESSION = {if ($_.PendingFileRenameOperations) {$true}}}

  }#Process
  End
  {
  }
}
#################
###   NOTES
#################
<#

    $creds = get-credential
    Get-RebootNeeded -computername win2k12

#>

