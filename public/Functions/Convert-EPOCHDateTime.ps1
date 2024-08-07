
Function Convert-EPOCHDateTime
{
<#
  .SYNOPSIS
    Converts Unix EPOCH time to a human readable date.
  .DESCRIPTION
    Converts Unix EPOCH time to a human readable date displaying in format of severl different time zones

  .Parameter InputTime
    The EPOCH time to convert
  .Parameter DummySwitch
    Just a dummy switch to test if udates are working. It doesn't really do anythng but spit a message to the screen in rghw "end" section of the function.
    
  .Example
    Convert-EPOCHDateTime -InputTime 1729999999

    InputTime LocalTimezone         LocalTime              UTCTime
    --------- -------------         ---------              -------
    1729999999 Eastern Standard Time 10/26/2024 11:33:19 PM 10/27/2024 3:33:19 AM


  .Example
    -9147600,1539613448,1529604105 | Convert-EPOCHDateTime

    InputTime LocalTimezone         LocalTime              UTCTime
    --------- -------------         ---------              -------
      -9147600 Eastern Standard Time 9/16/1969 11:00:00 PM  9/17/1969 3:00:00 AM
      1539613448 Eastern Standard Time 10/15/2018 10:24:08 AM 10/15/2018 2:24:08 PM
      1529604105 Eastern Standard Time 6/21/2018 2:01:45 PM   6/21/2018 6:01:45 PM


  .Link
    https://github.com/JohnnyLeuthard/MyModules/blob/main/en-us/MD/Convert-EPOCHDateTime.md
  
  .Notes
    Author: Johnny Leuthard

#>
[CmdletBinding(SupportsShouldProcess,DefaultParameterSetName = 'All')]
Param
  (
    [Parameter(Position = 0, ValueFromPipeline, Mandatory,ParameterSetName='All')]
    [Parameter(ValueFromPipeline,ParameterSetName='Dummy')]
    [ValidateNotNullOrEmpty()]
    [Alias("Time")]
      [string]$InputTime,
    
    [Parameter(Position = 0, ValueFromPipeline, Mandatory,ParameterSetName='Dummy')]
    [Alias("Dummy")]
		  [switch]$DummySwitch 
  )
  Begin
  {
    Write-Verbose "Processing EPOCH Times..."
  }
  Process
  {

    Write-Verbose "...Processing time [$InputTime]"
    $FriendlyDate = (get-date '1/1/1970').addseconds($inputTime)
    # Get Local timezone
    ##$strCurrentTimeZone = (gwm-wmiobject win32_timezone).StandardName
    ##$TZ = [System.TimeZoneInfo]::FindSystemTimeZoneById(($strCurrentTimeZone)
    ##$LocalTime = [System.TimeZoneInfo]::convertTimeZone.tolocalTime($FriendlyDate) )
    $LocalTime = ( [System.TimeZone]::CurrentTimeZone.ToLocalTime($FriendlyDate) )

    $HashData = [ordered]@{
      'InputTime'     = $InputTime
      'LocalTimezone' = ( [System.TimeZone]::CurrentTimeZone).StandardName
      'LocalTime'     = $LocalTime
      'UTCTime'       = $FriendlyDate
    }
    New-Object -TypeName psobject -Property $HashData
  }
  end
  {
      If($DummySwitch -eq $true){
        Write-Verbose "*** Dummy switch sullplied! ***"
        Write-Output "Dummy Switch supplied"
      }
  }
}#(Function Convert-EPOCHDateTime)
##################
<#


#>


