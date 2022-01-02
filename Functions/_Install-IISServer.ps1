#REQUIRES -RunAsAdministrator

Function Install-IISServer
{
<#
   	.SYNOPSIS

	.DESCRIPTION


	.PARAMETER InetPubPath
    Location to put the InetPub folder
	.PARAMETER NewLocation
    New location of IntePub folder
	.PARAMETER Move
    Switch to indicate the InetPub folder is to be moved. The 'NewLocation' parameter will be required


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

    [CmdletBinding(SupportsShouldProcess,DefaultParameterSetName='Default')]
	param 
	(

		[Parameter(ParameterSetName='Default')]
		[Parameter(ParameterSetName='Move')]
		[string]$InetPubPath = 'C:\InetPub',

		[Parameter(Mandatory,ParameterSetName='Move')]
		[string]$NewLocation,


		[Parameter(ParameterSetName='Move')]
		[switch]$move

	)
	Begin
    {

		Write-Debug "Begin section reached"
	}
	Process
    {
		write-Debug "Process section reached"


        #-- List of Windows Features to install
        # Web Server features
        $IISFeatireList = 'Web-Server','Web-ASP','Web-ASP-Net45'
        # Additional features either required by policy or for enhanced security controls 
        $AdditionalFeaturesList = 'WAS'   
        #-- Load features to install in a master variable
        $AllFeaturesToInstall = @()
        $AllFeaturesToInstall += $IISFeatireList
        $AllFeaturesToInstall += $AdditionalFeaturesList
        #$AllFeaturesToInstall += 'Forces-Fail' # Uncomment this to force a failure doe testing/debug


        # loop throgh the Windows Feature list and install eachs
        $Global:FeatureInstallResults = @() # Initalize results variable to aboid any possible bleadover
        Write-Verbose "[Info]---> Installing Windows Features --->"
        $AllFeaturesToInstall | % {
            
            Write-Verbose "[Info]-----> Feature [$_]"
            $FeatureInstallResults = @() # Initalize results variable to aboid any possible bleadover
            
            Try {             
                $Global:FeatureInstallResults += Install-WindowsFeature -Name $_  
            } 
            Catch {       
                Write-Error "Error Installing feature [$_]"
                Write-Debug "[DEBUG] ---> Installing feature [$_], see FeatureInstallResult variables"
            }#(Try..Catch)
 
        }#(% AllFeaturesToInstall)



        ##?? Maybe add this to a multi level array and return that result with eveything else? ##?? write results to a log file?
        If (  ($Global:FeatureInstallResults.RestartNeeded) -contains 'Yes')
        {
            Write-Output "Restart needed to complete features Install"
        }
        

        # Move switch specified to move the folder to a different default location
        If($move) {
            
            Write-Verbose "Moving IIS install path [$InstallPath] to new location [$NewLocation]"

        }#(if $move)


	}#(Pocess)
	End 
    {
		write-debug "END section reached"
		Write-Output $someData

	}#(End)

}
#####################################
### NOTES
#####################################
<#

Install-IISServer -debug


#>

