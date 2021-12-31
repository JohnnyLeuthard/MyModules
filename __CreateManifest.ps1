
$ModuleName = 'MyModules'
$ModPath = "C:\Users\Administrator\Documents\WindowsPowerShell\Modules\$ModuleName\$ModuleName.psd1"
    
$Hash = @{

    Path = $ModPath
    RootModule = 'MyModules.psm1'
    ModuleVersion = '1.0'
    Guid ='33316de0-fd66-403b-ae96-11a211b082eb' 
    Author ='Johnny Leuthard' 
    CompanyName = 'Johnny Leuthard'
    Copyright = '(c) 2018 johnnyleuthard. All rights reserved.'
    Description = 'My custom modules. testing, playing, templates, etc.'
    PowerShellVersion = '5.1'
    #PowerShellHostName = ''
    #PowerShellHostVersion = ''
    #DotNetFrameworkVersion = ''
    #CLRVersion = ''
    #RequiredAssemblies = ''
    ScriptsToProcess = '__Startup.ps1'
    FunctionsToExport = '*'
    CmdletsToExport = '*'
    VariablesToExport ='*'
    AliasesToExport ='*'
    FileList = ('RequiredFile1.txt','RequiredFile2.txt')
    HelpInfoURI = 'https://github.com/JohnnyLeuthard/MyModulesModHelp'
}

New-ModuleManifest @hash


