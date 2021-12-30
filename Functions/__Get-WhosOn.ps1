#REQUIRES -Version 3.0

Function Get-WhosOn
{
  <#
   	.Synopsis
		Get who is logged on a server
   	.Description
		Get a list of users who ate logged onto a server or a list of servers
	.Parameter ComputerName
		The computer(s) to query for who is logged on

   	.Example
		Get-WhosOn Server1

		Description
		---------------------
		Get a list of users logged onto the server named Server1

	.Example
		$servers | Get-WhosOn

		Description
		---------------------
		Takes a variable named $servers that is full of server names and passes it off to the Get-WhosOn Module
		Displays all logged on users for each server

	.Notes
    		Author: Johnny Leuthard
	.link
			https://github.com/JohnnyLeuthard/MyModules
	#>

  [CmdletBinding(DefaultParameterSetName = 'None')]

    Param
    (
	  	[Parameter(ValueFromPipeline, Position = 0)]
		[ValidateScript({if (!(Test-Connection -ComputerName $_ -Quiet -Count 1)){throw "The computer [$_] is offline. Try another"}else{$true}})]
            $ComputerName = $env:COMPUTERNAME,
        
        [switch]$LogOff #not in use yet will be used to log off all active sessions
    )

    Begin
    {

    }
    Process
    {
        #$psCmdlet.WriteVerbose("Verbose Mode") #displays when the -verbose switch is used
        $users = Get-WMIObject Win32_Process -filter 'name="explorer.exe"' -computername $ComputerName #| ForEach-Object { $owner = $_.GetOwner(); '{0}\{1}' -f $owner.Domain, $owner.User } | Sort-Object #| Get-Unique

    Foreach ($user in $users)
    {
      If ($user -ne $null)
      {
        $MyCustomObject = New-Object System.Object
        $MyCustomObject | Add-Member -type NoteProperty -name ComputerName -value $ComputerName.ToUpper().split(".")[0]
        $MyCustomObject | Add-Member -type NoteProperty -name Username -value $User.GetOwner().User
        $MyCustomObject | Add-Member -type NoteProperty -name Domain -value $User.GetOwner().Domain

        $MyCustomObject
      }
    }
  }
  End
  {

 	}
}#End Function
###################
## Notes
###################
<#


TO DO
--------
- set up switch to log users off??


#>

