#REQUIRES -Version 2.0
<#
   	.Synopsis
		Speek a phrase
   	.Description
		Speek a phrase supplied by the pipeline or command

	.Parameter Text
		The text you want spoken
	.Parameter Rate
		The rate you want it to speek
		default is -5
	.Parameter Volume
		The volume (1-100) that you want it to speek at
		Default is 50

   	.Example

		"Test" | Invoke-Voice

		Description
		-------------------
		Speeks the work "Test"

	.Example

		Invoke-Voice -Text "Test" -rate -5 -vomume 75

		Description
		-------------------
		Speeks the word test at a volume level of 75% and a rate of -5

	.Example

		get-Content Names.txt

		Description
		-------------------
		Reads the contents of the names.txt file

	.Link

	.Notes
    		Author: Johnny Leuthard

#>
Function Invoke-Voice
{

  [cmdletbinding()]
  Param
  (
    [Parameter(ValueFromPipeline = $true, Position = 0, Mandatory = $false)]
    $Text = "You did not supply any text",
    [Parameter(ValueFromPipeline = $false, Position = 1, Mandatory = $false)]
    $Rate = 0,
    [Parameter(ValueFromPipeline = $false, Position = 2, Mandatory = $false)]
    $Volume = 50

  )
  Begin
  {
    $voice = New-Object -ComObject SAPI.SPVoice
  }
  Process
  {

    ##Speak the latest error message
    #$error | % { (New-Object -ComObject SAPI.SPVoice).Speak($_.Message) }

    $voice.Rate = $Rate
    #$voice.Volume = $Volume
    $voice.Volume = $Volume
    [Void]$voice.Speak($Text)
 	}
  End
  {
  }

}#End Function
#################
### Notes
#################
<#


#>

