
class car
{
    [string]$vin
    static [int]$numberofWheeles = 4
    [int]$NumberOfDoors
    [datetime]$year
    [string]$model
    [string]$color

    paint ([string]$paint)
    {
        $this.color = $paint
        Write-Host "New car color is $paint" -ForegroundColor $paint
    }
    
}

