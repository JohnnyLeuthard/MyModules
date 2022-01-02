
Function ConvertFrom-EPOCHTime
{
<#
.Synopsis

.description

.Parameter InputTime
The EPOCH time to converte

.Example
Convert-EPOCHDateTime -InputTime -9147600
Converts Unix EPOCH time -9147600 to a human readable date

.Example
-9147600,1539613448,1529604105 | ConvertFrom-EPOCHTime
.Example
ConvertFrom-EPOCHTime -EPOCHTime 1529604105

.INPUTS

.OUTPUTS

.Link
    https://github.com/JohnnyLeuthard/MyModules

.Notes
    Author: Johnny Leuthard
#>
  [CmdletBinding(SupportsShouldProcess,DefaultParameterSetName = 'Pipeline')]
  Param
  (
        [Parameter(ValueFromPipeline,ParameterSetName='Pipeline',Mandatory)]
        [ValidateNotNullOrEmpty()]
        [Alias("seconds")]
        $EPOCHTime
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
          'EPOCHTime'           = $EPOCHTime
          'LocalTimezone'       = ( [System.TimeZone]::CurrentTimeZone).StandardName
          'LocalTimeUptime'     = $LocalTime
          'UTCTimeUptime'       = $FriendlyDate
        }
        $Result = New-Object -TypeName psobject -Property $HashData
        Write-Output $Result
  }
  end
  {
  }
}#(Function Convert-EPOCHDateTime)
##################
<#

Convert-EPOCHDateTime -InputTime '1636112341' -outvariable temp


#>


