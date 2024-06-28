---
external help file: MyModules-help.xml
Module Name: MyModules
online version:
schema: 2.0.0
---

# Get-SPN

## SYNOPSIS
Get SPN of a server or list of servers

## SYNTAX

```
Get-SPN [[-ComputerName] <Object>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get Service Principal Names (SPN) of a server or list of servers.

## EXAMPLES

### EXAMPLE 1
```
get-spn
```

Gets the SPN of the current computer

### EXAMPLE 2
```powershell
Get-SPN Server1
Get-SPN -ComputerName Server1
```
Gets the SPN's of a server names Server1


### EXAMPLE 3
```powershell
$ServerList | Get-SPN
```
Gets the SPN's of a list of servers contained in the variable names $ServerList

### EXAMPLE 4
```powershell
Get-Content "C:\Temp\Servers.txt" | Get-SPN
```
Gets the SPN's of a list of servers contained in the text file C:\Temp\Servers.txt


### EXAMPLE 5
```powershell
Get-Content "C:\Temp\Servers.txt" | Get-SPN | Export-Csv -NoTypeInformation "C:\Temp\SPNData.csv"
```

Gets the SPN's of a list of servers contained in the text file C:\Temp\Servers.txt 
Then exports it to the CSV file C:\Temp\SPNData.csv

### EXAMPLE 6
```powershell
Get-Content "C:\Temp\Servers.txt" | Get-SPN | Export-Clixml  "C:\Temp\SPNData.xml"
```
Gets the SPN's of a list of servers contained in the text file C:\Temp\Servers.txt 
Then exports it to the XML file C:\Temp\SPNData.xml

## PARAMETERS

### -ComputerName
{{ Fill ComputerName Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: $env:ComputerName
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Author: Johnny Leuthard

## RELATED LINKS
