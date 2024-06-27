
# Set a Global variable (used for testing, validation, etc.)
Set-Variable -Name TestGlobalVar -Value "This is a test 1...2...3" -Scope Global

#-- Dynamicly determine Module Name
$directorySeparator             = [System.IO.Path]::DirectorySeparatorChar
$moduleName                     = $PSScriptRoot.Split($directorySeparator)[-1]
#-- Manifest file name
$moduleManifest                 = $PSScriptRoot + $directorySeparator + $moduleName + '.psd1'
#-- Public functions folder path
$GLOBAL:publicFunctionsPath     = $PSScriptRoot + $directorySeparator + 'Public' + $directorySeparator + 'Functions'
#-- Private functions folder path
$privateFunctionsPath           = $PSScriptRoot + $directorySeparator + 'Private' + $directorySeparator + 'Functions'
$currentManifest                = Test-ModuleManifest $moduleManifest

$aliases = @()
$Global:publicFunctions = Get-ChildItem -Path $GLOBAL:publicFunctionsPath -Recurse | Where-Object { ($_Name -notlike "__*") -and ($_.Extension -eq '.ps1')}
$privateFunctions       = Get-ChildItem -Path $privateFunctionsPath -Recurse | Where-Object { ($_Name -notlike "__*") -and ($_.Extension -eq '.ps1')}
$Global:publicFunctions | ForEach-Object { . $_.FullName }
$privateFunctions | ForEach-Object { . $_.FullName }

$Global:publicFunctions | ForEach-Object { # Export all of the public functions from this module

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

$functionsAdded     = $Global:publicFunctions | Where-Object {$_.BaseName -notin $currentManifest.ExportedFunctions.Keys}
$functionsRemoved   = $currentManifest.ExportedFunctions.Keys | Where-Object {$_ -notin $Global:publicFunctions.BaseName}
$aliasesAdded       = $aliases | Where-Object {$_ -notin $currentManifest.ExportedAliases.Keys}
$aliasesRemoved     = $currentManifest.ExportedAliases.Keys | Where-Object {$_ -notin $aliases}

if ($functionsAdded -or $functionsRemoved -or $aliasesAdded -or $aliasesRemoved) {
    try {
        $updateModuleManifestParams = @{}
        $updateModuleManifestParams.Add('Path', $moduleManifest)
        $updateModuleManifestParams.Add('ErrorAction', 'Stop')
        if ($aliases.Count -gt 0) { $updateModuleManifestParams.Add('AliasesToExport', $aliases) }
        if ($GLOBAL:publicFunctions.Count -gt 0) { $updateModuleManifestParams.Add('FunctionsToExport', $GLOBAL:publicFunctions.BaseName) }

        Update-ModuleManifest @updateModuleManifestParams
    }
    catch {
        $_ | Write-Error
    }
}

