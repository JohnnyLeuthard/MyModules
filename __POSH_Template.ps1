#REQUIRES -RunAsAdministrator

Function POSH_Template
{
<#
   	.SYNOPSIS

	.DESCRIPTION


	.PARAMETER InstallPath
	.PARAMETER NewLocation
	.PARAMETER move

   	.EXAMPLE
	    Install-IISServer
		Install IIS on the local computer


    .INPUTS
    .OUTPUTS

   	.LINK
    https://github.com/JohnnyLeuthard/MyModules/ModHelp

   	.NOTES
    	Author: Johnny Leuthard

#>

    [CmdletBinding(SupportsShouldProcess,DefaultParameterSetName='PipelineeByPropertyName')]
    param 
    (
		[Parameter(Mandatory,ParameterSetName = 'ByName',HelpMessage = "Enter the Name you want to use")]
		[Parameter(Mandatory,ParameterSetName = 'None')]
		[ValidateCount(1, 5)]
		[string[]]$Name,
		
		[Parameter(Mandatory,ParameterSetName = 'ById')]
		[ValidateNotNullOrEmpty()]
		[string]$Id,

		[Parameter(ParameterSetName = 'ByName',HelpMessage = "Enter the Name you want to use")]
		[Parameter(ParameterSetName = 'ById')]
		[ValidateNotNullOrEmpty()]
		[ValidateRange(1, 5)]
		[int]$Count = 1,
	
		[Parameter()]
		[ValidateNotNull()]
		[ValidateRange(512MB, 1024MB)]
		[int]$MemoryStartupBytes,
		
		[Parameter()]
		[ValidateNotNullOrEmpty()]
		[ValidateSet('1', '2')]
		[int]$Generation = 2,
		
		[Parameter(ParameterSetName = 'ByName',HelpMessage = "Enter the Name you want to use")]
		[Parameter(ParameterSetName = 'ById')]
		[ValidatePattern('^D:\\')]
		[ValidateScript({if (-not (test-path -path $_)){throw "The folder [$_] does not exist. pleae try another."}else{$true}})]
		[string]$Path = 'C:\somebogusfolder',
		
		[Parameter()]
		[AllowNull()]
		[string]$OperatingSystem,
		
		[Parameter(Mandatory)]
		[ValidateNotNull()]
		[string]$NullParamTest,

        [Parameter()]
		[ValidateNotNullOrEmpty()]
		[string]$NullEmptyParamTest,
		
		[Parameter()]
		[AllowNull()]
		[string]$AllowNullParam
    )
	Begin {

		# Create a file?
		# Do something just once
		Write-Debug "Begin section reached"
	}
	Process {

		write-Debug "Process section reached"
		if ($PSCmdlet.ParameterSetName -eq 'ById')
		{
			Write-Host "You're using the $($PSCmdlet.ParameterSetName)  parameter set by using the Id parameter [$($Id)]"
		}
		elseif ($PSCmdlet.ParameterSetName -eq 'ByName')
		{
			Write-Host "You're using the ByName parameter set by using the Name parameter [$($Name)]"	
		}

		Write-Verbose "This is a verbose message"
		Write-Debug "This is a debug message used with the -debug switch"



	}#(Pocess)
	End {
		write-debug "END section reached"

		Write-Output $someData

	}#(End)

}
#####################################
### NOTES
#####################################
<#

POSH_Template -debug


#>

