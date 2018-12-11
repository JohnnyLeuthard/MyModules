Function Convert-EPOCHDateTime
{
  [CmdletBinding()]
  Param
  (
    [Parameter(Position = 0, ValueFromPipeline = $true, Mandatory = $True)]
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

Convert-EPOCHDateTime -InputTime 1532422336 | fl

#>
