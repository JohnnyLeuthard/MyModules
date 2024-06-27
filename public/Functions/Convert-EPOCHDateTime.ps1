
Function Convert-EPOCHDateTime
{
<#
  .Synopsis

  .description

  .Parameter InputTime
    The EPOCH time to convert
    
  .Example
    Convert-EPOCHDateTime -InputTime -9147600

    Converts Unix EPOCH time -9147600 to a human readable date

  .Example
    -9147600,1539613448,1529604105 | Convert-EPOCHDateTime


  .Link
    https://github.com/JohnnyLeuthard/MyModules/blob/main/en-us/MD/Convert-EPOCHDateTime.md
  .Notes
    Author: Johnny Leuthard

#>
  [CmdletBinding(SupportsShouldProcess,DefaultParameterSetName = 'None')]
  Param
  (
    [Parameter(Position = 0, ValueFromPipeline, Mandatory)]
    [ValidateNotNullOrEmpty()]
      $InputTime
      
  )
  Begin
  {
  }
  Process
  {

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
  }
}#(Function Convert-EPOCHDateTime)
##################
<#

Convert-EPOCHDateTime -InputTime '1636112341'

#>


