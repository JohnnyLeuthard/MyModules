# Set a Global variable (used for testing, validation, etc.)
Set-Variable -Name TestGlobalVar -Value "This is a test 1...2...3" -Scope Global

#write-Host "PSScriptRoot path is: $PSScriptRoot" -ForegroundColor Green
# Dynamicly determine Module Name
$directorySeparator = [System.IO.Path]::DirectorySeparatorChar
$moduleName = $PSScriptRoot.Split($directorySeparator)[-1]
#-- Manifest file name
$moduleManifest = $PSScriptRoot + $directorySeparator + $moduleName + '.psd1'
#-- Public functions folder path
$publicFunctionsPath    = $PSScriptRoot + $directorySeparator + 'Public' + $directorySeparator + 'Functions'
#-- Private functions folder path
$privateFunctionsPath   = $PSScriptRoot + $directorySeparator + 'Private' + $directorySeparator + 'Functions'
$currentManifest        = Test-ModuleManifest $moduleManifest

# Get list of PS1 files in the functions folders (files atrating with __ get ignored)
$aliases = @()  ##??
$publicFunctions  = Get-ChildItem -Path $publicFunctionsPath -Recurse  | Where-Object { ($_.Name -notlike "__*") -and ($_.Extension -eq '.ps1')}
$privateFunctions = Get-ChildItem -Path $privateFunctionsPath -Recurse | Where-Object { ($_.Name -notlike "__*") -and ($_.Extension -eq '.ps1')}
#$publicFunctions  = Get-ChildItem -Path $publicFunctionsPath  | Where-Object {$_.Extension -eq '.ps1'}
#$privateFunctions = Get-ChildItem -Path $privateFunctionsPath | Where-Object {$_.Extension -eq '.ps1'}
#-- DOT source scripts
$PublicFunctions | ForEach-Object { . $_.FullName }
$privateFunctions | ForEach-Object { . $_.FullName }

# Export all of the public functions from this module
$publicFunctions | ForEach-Object { 

    # The command has already been sourced in above. Query any defined aliases.
    $alias = Get-Alias -Definition $_.BaseName -ErrorAction SilentlyContinue
    if ($alias) {
        $aliases += $alias
        Export-ModuleMember -Function $_.BaseName -Alias $alias
    }
    else {
        Export-ModuleMember -Function $_.BaseName
    }
}

# Get list of ublic functions/alises losted in manifest and add/remove changes
$functionsAdded     = $publicFunctions | Where-Object {$_.BaseName -notin $currentManifest.ExportedFunctions.Keys}
$functionsRemoved   = $currentManifest.ExportedFunctions.Keys | Where-Object {$_ -notin $publicFunctions.BaseName}
$aliasesAdded       = $aliases | Where-Object {$_ -notin $currentManifest.ExportedAliases.Keys}
$aliasesRemoved     = $currentManifest.ExportedAliases.Keys | Where-Object {$_ -notin $aliases}

# If there are aliases or public functions added/removed update the manifest with those changes
if ($functionsAdded -or $functionsRemoved -or $aliasesAdded -or $aliasesRemoved) {
    try {
        $updateModuleManifestParams = @{}
        $updateModuleManifestParams.Add('Path', $moduleManifest)
        $updateModuleManifestParams.Add('ErrorAction', 'Stop')
        if ($aliases.Count -gt 0) { $updateModuleManifestParams.Add('AliasesToExport', $aliases) }
        if ($publicFunctions.Count -gt 0) { $updateModuleManifestParams.Add('FunctionsToExport', $publicFunctions.BaseName) }
        # Update manifest (PSD1) file
        Update-ModuleManifest @updateModuleManifestParams
    }
    catch {
        $_ | Write-Error
    }
}

# Load classes
#". $PSScriptRoot/Clases/ClassCar.ps1"



#########################
### NOTES
#########################
<#



#>

