#REQUIRES -Version 5.1

Function Get-Uptime
{
<#
   	.Synopsis
		Gets uptimes on server(s)
	.Description
		Gets uptime on a single server or a list of servers.

	.Parameter ComputerName
		The name of the computers(s) to check uptime status of.
        If one is not provided it used the local computername


   	.Example
		Get-Uptime
		Gets uptime on current server
	.Example
		Get-Uptime -ComputerName Server1
		Gets the uptime on a single server named Server1
	.Example
		Get-Uptime Server1
		Gets the uptime on a single server named Server1
	.Example
		$Servers | Get-Uptime
		Gets the uptime of a list of servers contained in a object variable called $Servers. As long as the servers variable has a property named "ComputerName"
	.Example
		Import-Csv "C:\Temp\Serverlist.csv" | Get-Uptime 
		Get uptime info on all servers listed in the file C:\temp\Serverlist.csv. The CSV must have a header named "ComputerName"


    .INPUTS

    .OUTPUTS


   	.Link
      https://github.com/JohnnyLeuthard/MyModules

   	.Notes
    	Author: Johnny Leuthard


#>
      [CmdletBinding(SupportsShouldProcess,DefaultParameterSetName='pelineByPropertyName')]
      Param
      (
            [Parameter(ValueFromPipelineByPropertyName,ParameterSetName='pelineByPropertyName')]
            #[Parameter(ValueFromPipeline,ParameterSetName='Pipeline')]
            [ValidateScript({if (-not (Test-Connection -Count 1 -Quiet -ComputerName $_)){throw "Computer [$_] not responding. pleae try another."}else{$true}})]
            $ComputerName = $Env:COMPUTERNAME

      )
      Begin
      {
            Write-Verbose "----> Getting uptime on servers..."
      }
      Process
      {
#    
            Write-Debug "Process section reached"
            Write-Verbose "------> Query host [$COMPUTERNAME]"
            #Get the last boot time of the current server
            $LastBoot = Get-WmiObject -class Win32_OperatingSystem -computer $COMPUTERNAME
         
            #Convert the last boot time to a readable format
            $LBTime = $LastBoot.ConvertToDateTime($LastBoot.Lastbootuptime)
            #get the difference between now and the last boot time
            [TimeSpan]$UPTime = New-TimeSpan $LBTime $(get-date)
        
            $Hash =[ordered]@{
                ComputerName = $COMPUTERNAME
                days         = $UPTime.days
                Hours        = $UPTime.Hours
                Minutes      = $UPTime.Minutes
                Seconds      = $UPTime.Seconds
            }
            write-debug "About to create object"
            Write-Verbose "------> Uptime results for host [$Computername]"
            New-Object -TypeName psobject -Property $hash
        }
        End
        {

        }

}#(function Get-Uptime)
###################
### Notes
###################
<#


#>

