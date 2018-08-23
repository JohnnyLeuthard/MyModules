Function Convert-EPOCHDateTime
{
  Param
  (
    $InputTime = '153242218'
  )

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

}#(Function Convert-EPOCHDateTime)
##################
<#

Convert-EPOCHDateTime -InputTime 1532422336 | fl

#>
