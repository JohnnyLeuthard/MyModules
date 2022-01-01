#REQUIRES -Version 2.0

<#
   	.Synopsis
		Get NIC info from a computer

	.Description
    	Get's NIC info from local or remote computer

	.Parameter ComputerName
		The name of the computer to get NIC info from

   	.Example
	    Get-NICS

		Get the NIC info from the local computer
    .Example
		Get-NICS servername

		Description
		----------------
		Get NIC info from renmote computer

	.Example
		Get-NICS "servername","servername"

		Description
		----------------
		Get NIC info on multiple computers

	.Example
		$ServerList | Get-NICS

		Description
		----------------
		Get NIC info on multiple computers listed in the array named $ServerList

	.Example

		Get-Nics | Where {$_.Enabled -eq $true}

		Description
		----------------
		Get NIC's that are enabled

   	.Link

   	.Notes
    	Author: Johnny Leuthard

#>
Function Get-NICS
{


  [CmdletBinding(SupportsShouldProcess,DefaultParameterSetName = 'None')]
  Param
  (
    [Parameter(ValueFromPipelineByPropertyName,Mandatory)]
    $ComputerName = $env:COMPUTERNAME
  )
  Begin
  {
  }
  Process
  {

    ##Collest NIC's from server and loopp through ading info to a custom object for output
    $NICList = (Get-WmiObject -class "Win32_NetworkAdapterConfiguration" -computername $ComputerName)
    Foreach ($NIC in $NICList  )
    {

      $objNICS = New-Object System.Object
      $objNICS | Add-Member -Type NoteProperty -Name ComputerName -Value $ComputerName.split(".")[0]
      $objNICS | Add-Member -Type NoteProperty -Name NICName -Value ($NIC.Caption.split("]")[1] )
      $objNICS | Add-Member -TYPE NoteProperty -Name IPAddress -Value $NIC.IPAddress
      #NICS | Add-Member -TYPE NoteProperty -Name IPAddress -Value ((NIC)[8]).IPAddress | %{$_}
      $objNICS | Add-Member -Type NoteProperty -Name MACAddress -Value $NIC.MACAddress
      $objNICS | Add-Member -Type NoteProperty -Name Gateway -Value $NIC.DefaultIPGateway
      $objNICS | Add-Member -Type NoteProperty -Name Domain -Value $NIC.DNSDomain
      $objNICS | Add-Member -Type NoteProperty -Name ServiceName -Value $NIC.ServiceName
      $objNICS | Add-Member -Type NoteProperty -Name Enabled -Value $NIC.IPEnabled

      $objNICS
    }

  }
  End
  {

 	}
}#End Function
#Notes
<#

#TODO
-------
- IPAddresss, MACAddresses, Gateway, etc... (loop through each and have a different entry for each IP if there are multiple per NIC)

#>

