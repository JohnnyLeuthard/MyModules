<#

    .Synopsis
        Gets a list of user ID's that have loged ontop a machine
	.Description
        Gets a list of user ID's that have loged ontop a machine
        It can be loacl or remote computers
	.Parameter ComputerName
        The computer(s) to run the script against



   	.Example
        Get-Logons

        Description
        ------------------
        Get's all accounts that have logged onto the local system

   	.Example
        Get-Logons Server1

        Description
        ------------------
        Get's all accounts that have logged onto the a remote system names Server1

    .Example
        $ServerList | Get-Logons

        Description
        ------------------
        Get's all accounts that have logged onto all the servers listed in a variable called $serverList


	.Link


	.Notes

        Author: Johnny Leuthard
        Author email:
        Creation Date:
        Last Update:
        Last Updated By:
        Updaters email:
        Revision: 1.0
        Requierments:
            - Powershell 2.0
            - Admin Rights on target server(s)

#>
Function Get-Logons
{

  [CmdletBinding(SupportsShouldProcess,DefaultParameterSetName = 'None')]
  Param
  (

    [Parameter(ValueFromPipeline, Position = 0, HelpMessage = "Name of the computer")]
    [ValidateNotNullOrEmpty()]
    $ComputerName = $Env:COMPUTERNAME

  )

  Begin
  {
    $ColServerName = @{Name = 'ServerName'; Expression = {$_.__SERVER}}
    $ColUserID = @{Name = 'UserName'; Expression = {$_.Name}}

  }
  Process
  {
    gwmi Win32_Desktop -ComputerName $Computername | Select-Object $ColServerName, $ColUserID
  }
  End
  {

 	}

} #End Function

#********************
#****** Notes *******
#********************
<#


#>

