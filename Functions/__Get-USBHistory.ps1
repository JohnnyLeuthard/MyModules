
Function Get-USBHistory
{
<#

	.SYNOPSIS
		This fucntion will get the history for USB devices that have been plugged into a machine.

	.DESCRIPTION
		This funciton queries the "SYSTEM\CurrentControlSet\Enum\USBSTOR" key to get a list of all USB storage devices that have
		been connected to a machine.  The funciton can run against local or remote machines.

	.PARAMETER  ComputerName
		Specifies the computer which you want to get the USB storage device history from.  The value can be a fully qualified domain
		name or an IP address.  This parameter can be piped to the function.  The local computer is the default.

	.Parameter Ping
			Use Ping to verify a computer is online before connecting to it.

	.EXAMPLE
		Get-USBHistory -ComputerName LAPTOP
        This command displays the history of USB storage device on the localhost.
	.EXAMPLE
		Servers = Get-Content ServerList.txt
		Get-USBHistory -ComputerName $Servers
		This command first creates an array of server names from ServerList.txt then executes the Get-USBHistory script on the array of servers.
	.EXAMPLE
		PS C:\>Get-USBHistory Server1 | Export-CSV -Path C:\Logs\USBHistory.csv -NoTypeInformation
		This command gets run the Get-USBHistory command on Server1 and pipes the output to a CSV file located in the C:\Logs directory.

    .INPUTS
        Inputs (if any)
    .OUTPUTS
        Output (if any)
    .LINK
    .FUNCTIONALITY

    .NOTES
        Author: Johnny Leuthard
#>

    [CmdletBinding(SupportsShouldProcess,DefaultParameterSetName='None')]
    Param
    (
        [Parameter(ValueFromPipelineByPropertyName,ParameterSetName='PipelineeByPropertyName')]
        #[Parameter(ValueFromPipeline,ParameterSetName='Pipeline')]
        [ValidateScript({if (-not (Test-Connection -Count 1 -Quiet -ComputerName $_)){throw "Computer [$_] not responding. pleae try another."}else{$true}})]
        [Alias("Name","Host")]
        [String[]]$ComputerName = $Env:COMPUTERNAME
    )

    Begin
    {

        $USBDevices = @()
        $Hive = "LocalMachine"
        $Key = "SYSTEM\CurrentControlSet\Enum\USBSTOR"

    }
    Process
    {

        Try
        {
            $SubKeys2 = @()
            $USBSTORSubKeys1 = @()
            $Reg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey($Hive, $Computer)
            $USBSTORKey = $Reg.OpenSubKey($Key)
            $USBSTORSubKeys1 = $USBSTORKey.GetSubKeyNames()

            ForEach ($SubKey1 in $USBSTORSubKeys1)
            {
                $Key2 = "SYSTEM\CurrentControlSet\Enum\USBSTOR\$SubKey1"
                $RegSubKey2 = $Reg.OpenSubKey($Key2)
                $SubkeyName2 = $RegSubKey2.GetSubKeyNames()
                $Subkeys2 += "$Key2\$SubKeyName2"
                $RegSubKey2.Close()
            }#end foreach SubKey1

            ForEach ($Subkey2 in $Subkeys2)
            {
                $USBKey = $Reg.OpenSubKey($Subkey2)
                $USBDevice = $USBKey.GetValue('FriendlyName')

                If ($USBDevice)
                {
                    $USBDevices += New-Object -TypeName PSObject -Property @{
                    USBDevice = $USBDevice
                    Computer  = $Computer
                    }
                }
                $USBKey.Close()
            }#end foreach SubKey2

            $USBSTORKey.Close()
        }#end try
        Catch
        {
            Write-Warning "There was an error connecting to the registry on $Computer or USBSTOR key not found. Ensure the remote registry service is running on the remote machine."
        }#end catch

        #Display results
        $USBDevices 

    }#(process))
    End
    {

    }#(end)
}#end function
###############
### NOTES
###############
<#

	Get-USBHistory

Update this function to use the registry PSDrive??


#>


