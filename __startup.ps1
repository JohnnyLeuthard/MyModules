    
    $directorySeparator     = [System.IO.Path]::DirectorySeparatorChar
    $moduleName             = $PSScriptRoot.Split($directorySeparator)[-1]
    $moduleName             = 'MyModules'
    
    $RequiredFiles = ((Get-Module $moduleName -ListAvailable).Filelist)
    #$RequiredFiles = ((Get-Module $moduleName).Filelist)

    
    Write-Host "------MOD Name --------------" -ForegroundColor Yellow
    Write-Host "Module Name:  $moduleName" -ForegroundColor green
    Write-Host "--------------------" -ForegroundColor Yellow

    Write-Host "------- Required Files ----------" -ForegroundColor Yellow
    #$RequiredFiles
    (Get-Module -ListAvailable $moduleName)
    #((Get-Module $moduleName).Filelist)
    Write-Host "--------------------" -ForegroundColor Yellow
    #Write-Host "Procesing required files......"        
    #$RequiredFiles

    
    $RequiredFiles | % {
        #Write-Host "File: $_" -ForegroundColor Green
        #
        If ((Test-Path $_) -eq $false) 
        {
            Write-Host $_ -ForegroundColor green
            Write-Warning "****** The file [$($_)] does not exsist and is listed in the required files for this module. please correct the problem and reliad the module ****** "  
        }
        else{}
        #>
    }
