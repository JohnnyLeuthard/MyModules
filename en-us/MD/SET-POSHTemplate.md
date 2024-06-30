---
external help file: MyModules-help.xml
Module Name: MyModules
online version:
schema: 2.0.0
---

# SET-POSHTemplate

## SYNOPSIS
Short description

## SYNTAX

### None (Default)
```
SET-POSHTemplate -UserName <String[]> -ComputerName <String[]> [-MemoryStartupBytes <Int32>]
 [-Generation <Int32>] [-OperatingSystem <String>] -NullParamTest <String> [-NullEmptyParamTest <String>]
 [-AllowNullParam <String>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByName
```
SET-POSHTemplate -UserName <String[]> [-Count <Int32>] [-MemoryStartupBytes <Int32>] [-Generation <Int32>]
 [-Path <String>] [-OperatingSystem <String>] -NullParamTest <String> [-NullEmptyParamTest <String>]
 [-AllowNullParam <String>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ById
```
SET-POSHTemplate -Id <String> [-Count <Int32>] [-MemoryStartupBytes <Int32>] [-Generation <Int32>]
 [-Path <String>] [-OperatingSystem <String>] -NullParamTest <String> [-NullEmptyParamTest <String>]
 [-AllowNullParam <String>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ComputerName
```
SET-POSHTemplate -ComputerName <String[]> [-MemoryStartupBytes <Int32>] [-Generation <Int32>]
 [-OperatingSystem <String>] -NullParamTest <String> [-NullEmptyParamTest <String>] [-AllowNullParam <String>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Long description

## EXAMPLES

### EXAMPLE 1
```
Explanation of what the example does
```

## PARAMETERS

### -UserName
Enter the Name you want to use

```yaml
Type: String[]
Parameter Sets: None, ByName
Aliases: Name

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
{{ Fill Id Description }}

```yaml
Type: String
Parameter Sets: ById
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ComputerName
{{ Fill ComputerName Description }}

```yaml
Type: String[]
Parameter Sets: None, ComputerName
Aliases: computer, Host

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Count
Enter a count number

```yaml
Type: Int32
Parameter Sets: ByName, ById
Aliases:

Required: False
Position: Named
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -MemoryStartupBytes
{{ Fill MemoryStartupBytes Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Generation
{{ Fill Generation Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 2
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Enter the folder path

```yaml
Type: String
Parameter Sets: ByName, ById
Aliases:

Required: False
Position: Named
Default value: C:\somebogusfolder
Accept pipeline input: False
Accept wildcard characters: False
```

### -OperatingSystem
{{ Fill OperatingSystem Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NullParamTest
{{ Fill NullParamTest Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NullEmptyParamTest
{{ Fill NullEmptyParamTest Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllowNullParam
{{ Fill AllowNullParam Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
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

### Inputs (if any)
## OUTPUTS

### Output (if any)
## NOTES
Author: Johnny Leuthard

## RELATED LINKS
