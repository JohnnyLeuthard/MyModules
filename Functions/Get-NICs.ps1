
Function Get-NICS
{
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
		Get NIC info from renmote computer
	.Example
		Get-NICS "servername","servername"
		Get NIC info on multiple computers
	.Example
		$ServerList | Get-NICS
		Get NIC info on multiple computers listed in the array named $ServerList
	.Example
        Get-Nics | Where {$_.Enabled -eq $true}
		Get NIC's that are enabled


    .INPUTS
    .OUTPUTS
   	.Link
      https://github.com/JohnnyLeuthard/MyModules/ModHelp

   	.Notes
    	Author: Johnny Leuthard

#>

        [CmdletBinding(SupportsShouldProcess,DefaultParameterSetName='PipelineeByPropertyName')]
        Param
        (
            [Parameter(ValueFromPipelineByPropertyName,ParameterSetName='PipelineeByPropertyName')]
            #[Parameter(ValueFromPipeline,ParameterSetName='Pipeline')]
            [ValidateScript({if (-not (Test-Connection -Count 1 -Quiet -ComputerName $_)){throw "Computer [$_] not responding. pleae try another."}else{$true}})]
            [Alias("Name","Host")]
            $ComputerName = $Env:COMPUTERNAME
        )
        Begin
        {
            Write-Verbose "----> Getting NIC Adapter ino on servers..."
        }#(begin)
        Process
        {

            Write-Debug "Process section reached"
            Write-Verbose "------> Query host [$COMPUTERNAME]"
            $NICList = (Get-WmiObject -class "Win32_NetworkAdapterConfiguration" -computername $ComputerName)
            Write-Debug 'NIC Info checkpoint - info stored on variable [$NICList]'
            Foreach ($NIC in $NICList  )
            {
                $Hash =[ordered]@{
                    ComputerName  =  $ComputerName
                    NICName  =  ($NIC.Caption.split("]")[1] )
                    IPAddress  =  $NIC.IPAddress
                    #IPAddress  =  ((NIC)[8]).IPAddress | %{$_}
                    MACAddress  =  $NIC.MACAddress
                    Gateway  =  $NIC.DefaultIPGateway
                    Domain  =  $NIC.DNSDomain
                    ServiceName  =  $NIC.ServiceName
                    Enabled  =  $NIC.IPEnabled
                }
                Write-Debug "About to create object"
                Write-Verbose "------> NIC results for host [$Computername]"
                New-Object -TypeName psobject -Property $hash
            }

        }#(Process)
        End
        {

        }#(end)
}#End Function
#Notes
<#

#TODO
-------
- IPAddresss, MACAddresses, Gateway, etc... (loop through each and have a different entry for each IP if there are multiple per NIC)

#>

